#plot3.R
##Of the four types of sources indicated by the 𝚝𝚢𝚙𝚎 (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

##load data 
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

##load ggplot
library(ggplot2)

##get subset for Baltimore
baltimoreNEI <- NEI[NEI$fips=="24510", ]

#get yearly emissions totals by type
yearlyTotals <- aggregate(Emissions ~ year + type, baltimoreNEI, sum)

##plot aggregated data
png("plot3.png", width=640, height=480)
g <- ggplot(yearlyTotals, aes(year, Emissions, color = type))
g <- g + geom_line() +
  xlab("Year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions in Baltimore City, Maryland 1999-2008')
print(g)
dev.off()