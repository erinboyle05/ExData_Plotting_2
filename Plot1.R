require(dplyr)
require(tidyr)
plot1data <- NEI %>% group_by(year) %>% summarise(sum(Emissions))
plot(plot1data$year, plot1data$`sum(Emissions)`, type = "o",
     main = "Total PM2.5 Emissions", xlab = "Year", ylab = "Total Emission (in tons)")
