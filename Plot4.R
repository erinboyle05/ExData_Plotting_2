require(dplyr)
require(tidyr)
coal <- SCC %>% filter(grepl('Combustion', SCC.Level.One)) %>%
        filter(grepl('Coal', SCC.Level.Three))
coal <- coallist$SCC
#plot4data <- NEI %>% filter(grepl(coal, SCC)) %>% group_by(year) %>%
#        summarise(Emissions = sum(Emissions))
