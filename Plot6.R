require(dplyr)
require(tidyr)
require(ggplot2)
source("getdata.R")
motorlist <- SCC %>% filter(grepl('Highway Vehicles', SCC.Level.Two))
motor <- motorlist$SCC

plot6data <- NEI %>% filter(grepl("24510|06037", fips)) %>%
        subset(SCC %in% motor) %>%
        group_by(fips, year) %>%
        summarise(Emissions = sum(Emissions))

plot6data$fips <- gsub("24510", "Baltimore City, Maryland", plot6data$fips)
plot6data$fips <- gsub("06037", "Los Angeles County, California", plot6data$fips)
png("Plot6.png")
print (qplot(year, Emissions, data = plot6data, color = fips,
             geom = c("point", "line"), ylab = "Emissions in tons",
             main = "PM2.5 Emissions"))
dev.off()
