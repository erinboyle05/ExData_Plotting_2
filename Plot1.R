#Load required packages into R
require(dplyr)
require(tidyr)

#Check if necessary datasets are loaded
#If not, call script to load datasets
if (!exists("NEI | SCC")) {
        source("getdata.R")
}

#Subset data
plot1data <- NEI %>% group_by(year) %>% summarise(sum(Emissions))

#Create plot and plot graphic file
png("Plot1.png")
plot(plot1data$year, plot1data$`sum(Emissions)`, type = "o",
     main = "Total PM2.5 Emissions", xlab = "Year", ylab = "Total Emission (in tons)")
dev.off()
