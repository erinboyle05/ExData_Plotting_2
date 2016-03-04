#Load required packages into R
require(dplyr)
require(tidyr)

#Check if necessary datasets are loaded
#If not, calls script to load datasets
if (!exists("NEI | SCC")) {
        source("getdata.R")
}

#Subset data
plot2data <- NEI %>% filter(fips == "24510") %>% group_by(year) %>% summarise(sum(Emissions))

#Create plot and plot graphic file
png("Plot2.png")
plot(plot2data$year, plot2data$`sum(Emissions)`, type = "o",
     main = "Total PM2.5 Emissions for Baltimore City, Maryland", xlab = "Year", ylab = "Total Emission (in tons)")
dev.off()
