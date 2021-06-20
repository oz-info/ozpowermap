library(eechidna)
library(tidyverse)
library(purrr)
library(knitr)
library(broom)
library(purrrlyr)
library(scales)
library(ggthemes)
library(spatial)
library(geojsonio)
library(spdplyr)
library(geojsonio)
library(spdplyr)
library(rmapshaper)
library(grid)
library(viridis)
library(sf)
library(leaflet)

quantile.t = function(v) ecdf(v)(v)

# data(abs2016)
# data(fp16)
# data(tpp16)
# data(tcp16)
# fp=fp16
# abs=abs2016
# tpp=tpp16
# tcp=tcp16

data(abs2016)
data(fp19)
data(tpp19)
data(tcp19)
abs=abs2016
fp=fp19
tpp=tpp19
tcp=tcp19

# inspect the data frame
glimpse(fp)
# show the first few rows
head(fp) %>% kable

# who_most_votes_prop <- fp %>% 
#     filter(CandidateID != 999) %>% #exclude informal votes
#     mutate(candidate_full_name = paste0(GivenNm, " ", Surname, " (", CandidateID, ")")) %>% 
#     group_by(candidate_full_name) %>% 
#     dplyr::summarise(total_votes_for_candidate = sum(Percent, rm.na = TRUE)) %>% 
#     arrange(desc(total_votes_for_candidate)) %>% 
#     dplyr::rename(percent_votes_for_candidate = total_votes_for_candidate)

partycolour_map = c(
    "AUSTRALIAN LABOR PARTY" = "#FF0033",
    "LIB/NATS COALITION" = "#0066CC",
    "INDEPENDENT" = "#000000",
    "KATTER'S AUSTRALIAN PARTY (KAP)" = "#CC3300",
    "PALMER's UNITED AUSTRALIA PARTY" = "#FFFF00",
    "CENTRE ALLIANCE" = "#883388",
    "THE GREENS" = "#009900"
)

cart.winners <- fp %>% 
    filter(Elected == "Y") %>% 
    select(DivisionNm, PartyNm,) %>% 
    mutate(PartyNm = ifelse(PartyNm %in% c("LIBERAL PARTY", "NATIONAL PARTY"), "LIB/NATS COALITION", PartyNm)) %>% 
    merge(nat_data, by.x="DivisionNm", by.y="elect_div")
# Plot it
ggplot(data=nat_map) +
    geom_polygon(aes(x=long, y=lat, group=group),
                 fill="grey90", colour="white") +
    geom_point(data=cart.winners, aes(x=x, y=y, colour=PartyNm), size=1.5, alpha=0.8) +
    scale_colour_manual(name="Political Party", values=partycolour_map) +
    theme_map() + coord_equal() + theme(legend.position="bottom")

tcpp = left_join(
    tcp %>% 
        distinct(CandidateID, .keep_all=TRUE) %>% #duplicate rows for some reason?
        rename(TCP_Percent=Percent, TCP_Votes=OrdinaryVotes),
    tpp %>% 
        select(DivisionNm, LNP_Votes, LNP_Percent, ALP_Votes, ALP_Percent, TotalVotes, Swing),
    by=c("DivisionNm"))

vp = left_join(
    tcpp,
    fp %>%
        distinct(CandidateID, .keep_all=TRUE) %>% # weird duplicates. why?
        select(CandidateID, OrdinaryVotes, Percent) %>%
        rename(FP_Percent=Percent, FP_OrdinaryVotes=OrdinaryVotes), 
    by=c("CandidateID")
)

vp.winners = vp %>% filter(Elected=="Y") %>%
    mutate(Margin=TCP_Votes-TotalVotes/2) %>%
    mutate(QMargin=1-quantile.t(Margin)) %>%
    mutate(QFP_Percent=1-quantile.t(FP_OrdinaryVotes)  # Maybe should be FP_Percent?
)

winners_sf = left_join(
    nat_sff %>%  dplyr::rename(DivisionNm = elect_div),
    vp.winners,
    by=c("DivisionNm"),
    copy=TRUE)

rawleafletmap <- leaflet(data=winners_sf) %>%
    addProviderTiles(
        "CartoDB.Positron",
        options = tileOptions(
            minZoom=4, 
            maxZoom=11
        )
    )

leafletmap <- rawleafletmap %>%
    addPolygons(
        # fillColor = ~pal(Christianity_diff)
) %>% addMarkers(
        ~long_c, ~lat_c, 
        popup = ~as.character(DivisionNm),
        label = ~as.character(DivisionNm),
    )
leafletmap