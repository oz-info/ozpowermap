library(eechidna)
library(tidyverse)
library(purrr)
library(knitr)
library(broom)
library(purrrlyr)
library(scales)
library(ggthemes)

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

# nat_map <- nat_map_download(2016)
# nat_data <- nat_data_download(2016)
# nat_map <- nat_map_download(2019)
# nat_data <- nat_data_download(2019)

# inspect the data frame
glimpse(fp)
# show the first few rows
head(fp) %>% kable

who_won <- tcp %>% 
    filter(Elected == "Y") %>% 
    group_by(PartyNm) %>% 
    tally() %>% 
    arrange(desc(n)) 
# inspect
who_won %>% 
    kable()
# plot
ggplot(who_won, 
       aes(reorder(PartyNm, n), 
           n)) +
    geom_point(size = 2) + 
    coord_flip() + 
    scale_y_continuous(labels = comma) +
    theme_bw() +
    ylab("Total number of electorates") +
    xlab("Party") +
    theme(text = element_text(size=10))

who_most_votes_prop <- fp %>% 
    filter(CandidateID != 999) %>% #exclude informal votes
    mutate(candidate_full_name = paste0(GivenNm, " ", Surname, " (", CandidateID, ")")) %>% 
    group_by(candidate_full_name) %>% 
    dplyr::summarise(total_votes_for_candidate = sum(Percent, rm.na = TRUE)) %>% 
    arrange(desc(total_votes_for_candidate)) %>% 
    dplyr::rename(percent_votes_for_candidate = total_votes_for_candidate)
# inspect
who_most_votes_prop %>% 
    mutate(percent_votes_for_candidate = 
               prettyNum(percent_votes_for_candidate, 
                         big.mark = ","))  %>% 
    head %>% 
    kable


ggplot(aes(map_id=id), data=nat_data) +
    geom_map(aes(fill=state), map=nat_map, col = "grey50") +
    expand_limits(x=nat_map$long, y=nat_map$lat) + 
    theme_map() + coord_equal()

# Colour cells to match that parties colours
# Order = Australian Labor Party, Independent, Katters, Lib/Nats Coalition, Palmer, The Greens
partycolours = c("#FF0033", "#000000", "#CC3300", "#0066CC", "#FFFF00", "#009900")

map.winners <- fp %>% filter(Elected == "Y") %>% 
    select(DivisionNm, PartyNm) %>% 
    merge(nat_map, by.x="DivisionNm", by.y="elect_div")
# Grouping
map.winners$PartyNm <- as.character(map.winners$PartyNm)
map.winners <- map.winners %>% arrange(group, order)
# Combine Liberal and National parties
map.winners <- map.winners %>% 
    mutate(PartyNm = ifelse(PartyNm %in% c("NATIONAL PARTY", "LIBERAL PARTY"), "LIBERAL NATIONAL COALITION", PartyNm))

# ggplot(data=map.winners) + 
#     geom_polygon(aes(x=long, y=lat, group=group, fill=PartyNm)) +
#     scale_fill_manual(name="Political Party", values=partycolours) +
#     theme_map() + coord_equal() + theme(legend.position="bottom")
# 

cart.winners <- fp %>% 
    filter(Elected == "Y") %>% 
    select(DivisionNm, PartyNm) %>% 
    mutate(PartyNm = ifelse(PartyNm %in% c("LIBERAL PARTY", "NATIONAL PARTY"), "LIB/NATS COALITION", PartyNm)) %>% 
    merge(nat_data, by.x="DivisionNm", by.y="elect_div")
# Plot it
ggplot(data=nat_map) +
    geom_polygon(aes(x=long, y=lat, group=group, order=order),
                 fill="grey90", colour="white") +
    geom_point(data=cart.winners, aes(x=x, y=y, colour=PartyNm), size=1.5, alpha=0.8) +
    scale_colour_manual(name="Political Party", values=partycolours) +
    theme_map() + coord_equal() + theme(legend.position="bottom")

tcpp = left_join(
    tcp %>% 
        distinct(CandidateID, .keep_all=TRUE) %>% #duplicate rows for some reason?
        rename(TCP_Percent=Percent, TCP_Votes=OrdinaryVotes),
    tpp %>% 
        select(DivisionID, UniqueID, LNP_Votes, LNP_Percent, ALP_Votes, ALP_Percent, TotalVotes, Swing),
    by=c("DivisionID", "UniqueID"))

vp = left_join(
    tcpp,
    fp %>% 
        distinct(CandidateID, .keep_all=TRUE) %>% # weird duplicates. why?
        select(CandidateID, OrdinaryVotes, Percent) %>%
        rename(FP_Percent=Percent, FP_OrdinaryVotes=OrdinaryVotes),
    by=c("CandidateID")
)

winners = vp[vp$Elected=="Y",]