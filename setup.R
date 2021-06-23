
library(eechidna)
library(sf)

# nat_map <- nat_map_download(2016)
# nat_data <- nat_data_download(2016)
# nat_map <- nat_map_download(2019)
nat_data <- nat_data_download(2019)
nat_sp <- sF_download(2019)
nat_sf <- as(nat_sp, "sf")
nat_sff <- st_transform(nat_sf, "+proj=longlat +datum=WGS84")

# saveRDS(nat_map, file = "nat_map.Rdata")
saveRDS(nat_sff, file = "nat_sff.Rdata")
saveRDS(nat_data, file = "nat_data.Rdata")

# download.file(
#   url=URL2PP,
#   destfile=DATAFILENAME,
#   method='auto')
# 
# division.data = read.csv('HouseTppByDivisionDownload-24310.csv', skip=1)\