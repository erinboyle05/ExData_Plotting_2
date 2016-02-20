require(dplyr)
require(tidyr)
require(ggplot2)
source("getdata.R")
plot3data <- NEI %>% filter(fips == "24510") %>% group_by(type, year) %>%
        summarise(Emissions = sum(Emissions))
plot3data$type <- as.factor(plot3data$type)
png("Plot3.png")
print (qplot(year, Emissions, data = plot3data, color = type,
             geom = c("point", "line"), ylab = "Emissions in tons",
             main = "PM2.5 Emissions in Baltimore City"))
dev.off()
