require(dplyr)
require(tidyr)
require(ggplot2)
plot3data <- NEI %>% filter(fips == "24510") %>% group_by(type, year) %>%
        summarise(Emissions = sum(Emissions))
plot3data$type <- as.factor(plot3data$type)

print (qplot(year, Emissions, data = plot3data, color = type,
             geom = c("point", "line"), ylab = "Emissions in tons",
             main = "PM2.5 Emissions in Baltimore City"))
