require(dplyr)
require(tidyr)
source("getdata.R")
plot2data <- NEI %>% filter(fips == "24510") %>% group_by(year) %>% summarise(sum(Emissions))
png("Plot2.png")
plot(plot2data$year, plot2data$`sum(Emissions)`, type = "o",
     main = "Total PM2.5 Emissions", sub = "for Baltimore City, Maryland", xlab = "Year", ylab = "Total Emission (in tons)")
dev.off()
