require(dplyr)
require(tidyr)
require(ggplot2)
source("getdata.R")
coallist <- SCC %>% filter(grepl('Combustion', SCC.Level.One)) %>%
        filter(grepl('Coal', SCC.Level.Three))
coal <- coallist$SCC
png("Plot4.png")
plot4data <- NEI %>% subset(SCC %in% coal) %>% group_by(year) %>%
       summarise(Emissions = sum(Emissions))
print (qplot(year, Emissions, data = plot4data,
            geom = c("point", "line"), ylab = "Emissions in tons",
            main = "US Coal Combustion-Related Emission"))
dev.off()
