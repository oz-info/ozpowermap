URL2PP = "https://results.aec.gov.au/24310/Website/Downloads/HouseTppByDivisionDownload-24310.csv"
DATAFILENAME = 'HouseTppByDivisionDownload-24310.csv'
# library(pins)
# pth = pin(URL_2PP)
devtools::install_github("ropenscilabs/eechidna", 
                         build_vignettes = TRUE)

# nat_map <- nat_map_download(2016)
# nat_data <- nat_data_download(2016)
nat_map <- nat_map_download(2019)
nat_data <- nat_data_download(2019)
nat_sF <- sF_download(2019)
# download.file(
#   url=URL2PP,
#   destfile=DATAFILENAME,
#   method='auto')
# 
# division.data = read.csv('HouseTppByDivisionDownload-24310.csv', skip=1)
