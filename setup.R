###
# This file sets up the necessary data by downloading it, then saves a local copy as an R datafram
# this should only need to be run infrequently.
# thereafter we use the local copy which is helpful when deploying a site from github or netlify etc
###

library(eechidna)
library(sf)

# nat_map <- nat_map_download(2016)
# nat_data <- nat_data_download(2016)
# nat_map <- nat_map_download(2019)
nat_data <- nat_data_download(2019)
nat_sp <- sF_download(2019)
nat_sf <- as(nat_sp, "sf")
nat_sff <- st_transform(nat_sf, "+proj=longlat +datum=WGS84") #https://github.com/r-spatial/sf/issues/363

# saveRDS(nat_map, file = "nat_map.Rdata")
saveRDS(nat_sff, file = "nat_sff.Rdata")
saveRDS(nat_data, file = "nat_data.Rdata")

