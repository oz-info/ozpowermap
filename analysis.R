library(eechidna)
library(tidyverse)
library(purrr)
library(knitr)
library(broom)
library(purrrlyr)
library(scales)
library(ggthemes)

data(fp16)
data(tpp16)
data(tcp16)
data(abs2016)

# inspect the data frame
glimpse(fp16)
# show the first few rows
head(fp16) %>% kable

who_won <- tcp16 %>% 
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

who_most_votes_prop <- fp16 %>% 
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

# nat_map19 <- nat_map_download(2019)
# nat_data19 <- nat_data_download(2019)
nat_map16 <- nat_map_download(2016)
nat_data16 <- nat_data_download(2016)
ggplot(aes(map_id=id), data=nat_data16) +
    geom_map(aes(fill=state), map=nat_map16, col = "grey50") +
    expand_limits(x=nat_map16$long, y=nat_map16$lat) + 
    theme_map() + coord_equal()


map.winners <- fp16 %>% filter(Elected == "Y") %>% 
    select(DivisionNm, PartyNm) %>% 
    merge(nat_map16, by.x="DivisionNm", by.y="elect_div")
# Grouping
map.winners$PartyNm <- as.character(map.winners$PartyNm)
map.winners <- map.winners %>% arrange(group, order)
# Combine Liberal and National parties
map.winners <- map.winners %>% 
    mutate(PartyNm = ifelse(PartyNm %in% c("NATIONAL PARTY", "LIBERAL PARTY"), "LIBERAL NATIONAL COALITION", PartyNm))
# Colour cells to match that parties colours
# Order = Australian Labor Party, Independent, Katters, Lib/Nats Coalition, Palmer, The Greens
partycolours = c("#FF0033", "#000000", "#CC3300", "#0066CC", "#FFFF00", "#009900")
# ggplot(data=map.winners) + 
#     geom_polygon(aes(x=long, y=lat, group=group, fill=PartyNm)) +
#     scale_fill_manual(name="Political Party", values=partycolours) +
#     theme_map() + coord_equal() + theme(legend.position="bottom")
# 

cart.winners <- fp16 %>% 
    filter(Elected == "Y") %>% 
    select(DivisionNm, PartyNm) %>% 
    mutate(PartyNm = ifelse(PartyNm %in% c("LIBERAL PARTY", "NATIONAL PARTY"), "LIB/NATS COALITION", PartyNm)) %>% 
    merge(nat_data16, by.x="DivisionNm", by.y="elect_div")
# Plot it
ggplot(data=nat_map16) +
    geom_polygon(aes(x=long, y=lat, group=group, order=order),
                 fill="grey90", colour="white") +
    geom_point(data=cart.winners, aes(x=x, y=y, colour=PartyNm), size=1.5, alpha=0.8) +
    scale_colour_manual(name="Political Party", values=partycolours) +
    theme_map() + coord_equal() + theme(legend.position="bottom")

