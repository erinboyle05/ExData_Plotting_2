#Load required packages into R
require(dplyr)
require(tidyr)
require(ggplot2)

#Check if necessary datasets are loaded
#If not, calls script to load datasets
if (!exists("NEI | SCC")) {
        source("getdata.R")
}

#Subset data
motorlist <- SCC %>% filter(grepl('Highway Vehicles', SCC.Level.Two))
motor <- motorlist$SCC

plot6data <- NEI %>% filter(grepl("24510|06037", fips)) %>%
        subset(SCC %in% motor) %>%
        group_by(fips, year) %>%
        summarise(Emissions = sum(Emissions))

plot6data$fips <- gsub("24510", "Baltimore City, Maryland", plot6data$fips)
plot6data$fips <- gsub("06037", "Los Angeles County, California", plot6data$fips)

#Create plot and plot graphic file
png("Plot6.png")
print (qplot(year, Emissions, data = plot6data, color = fips,
             geom = c("point", "line"), ylab = "Emissions (in tons)",
             main = "PM2.5 Emissions from Motor Vehicles"))
dev.off()
