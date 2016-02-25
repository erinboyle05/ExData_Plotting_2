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
plot5data <- NEI %>% filter(fips == "24510") %>%
        subset(SCC %in% motor) %>%
        group_by(year) %>%
        summarise(Emissions = sum(Emissions))

#Create plot and plot graphic file
png("Plot5.png")
print (qplot(year, Emissions, data = plot5data,
            geom = c("point", "line"), ylab = "Emissions in tons",
            main = "Emissions by Motor Vehicles in Baltimore City"))
dev.off()
