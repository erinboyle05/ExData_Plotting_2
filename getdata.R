# This file downloads the data from the web and only stores data
# from 2007-02-01 to 2007-02-02

if (!file.exists("NEI_data.zip")) {
        
        file_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
        download.file(file_url, "NEI_data.zip", mode = "wb")
        unzip("NEI_data.zip")
}
if (!exists("NEI")) {
        NEI <- readRDS("summarySCC_PM25.rds")
        
}

if (!exists("SCC")) {
        SCC <- readRDS("Source_Classification_Code.rds")
}


