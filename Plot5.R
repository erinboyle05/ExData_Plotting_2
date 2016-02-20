require(dplyr)
require(tidyr)
require(ggplot2)
source("getdata.R")
motorlist <- SCC %>% filter(grepl('Highway Vehicles', SCC.Level.Two))
motor <- motorlist$SCC
plot5data <- NEI %>% filter(fips == "24510") %>%
        subset(SCC %in% motor) %>%
        group_by(year) %>%
        summarise(Emissions = sum(Emissions))
png("Plot5.png")
print (qplot(year, Emissions, data = plot5data,
            geom = c("point", "line"), ylab = "Emissions in tons",
            main = "Emissions by Motor Vehicles in Baltimore City"))
dev.off()
