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
coallist <- SCC %>% filter(grepl('Combustion', SCC.Level.One)) %>%
        filter(grepl('Coal', SCC.Level.Three))
coal <- coallist$SCC

#Create plot and plot graphic file
png("Plot4.png")
plot4data <- NEI %>% subset(SCC %in% coal) %>% group_by(year) %>%
       summarise(Emissions = sum(Emissions))
print (qplot(year, Emissions, data = plot4data,
            geom = c("point", "line"), ylab = "Emissions (in tons)",
            main = "US Coal Combustion-Related Emission"))
dev.off()
