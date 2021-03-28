
library(eechidna)


# nat_map <- nat_map_download(2016)
# nat_data <- nat_data_download(2016)
nat_map <- nat_map_download(2019)
nat_data <- nat_data_download(2019)
nat_sp <- sF_download(2019)
nat_sf <- as(nat_sp, "sf")

# download.file(
#   url=URL2PP,
#   destfile=DATAFILENAME,
#   method='auto')
# 
# division.data = read.csv('HouseTppByDivisionDownload-24310.csv', skip=1)\