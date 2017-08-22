#plot4.R
##Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

##load data 
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

##load libraries
library(ggplot2)

##merge the two data sets 
combined <- merge(NEI, SCC, by="SCC")


##get all combined records with Short.Name (SCC) Coal
coalMatches  <- grepl("coal", combined$Short.Name, ignore.case=TRUE)
subsetCombined <- combined[coalMatches, ]

##get yearly totals
yearlyTotals <- aggregate(Emissions ~ year, subsetCombined, sum)

#plot data
png("plot4.png", width=640, height=480)
g <- ggplot(yearlyTotals, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("Year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from coal sources 1999-2008')
print(g)
dev.off()