#plot6.R
##Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (𝚏𝚒𝚙𝚜 == "𝟶𝟼𝟶𝟹𝟽"). Which city has seen greater changes over time in motor vehicle emissions?

##load data 
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

##load libraries
library(ggplot2)

##get subset for Baltimore and Los Angeles motor vehicle sources
baltimoreLAMotorNEI <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

##get totals by year and location
yearlyTotals <- aggregate(Emissions ~ year + fips, baltimoreLAMotorNEI, sum)
yearlyTotals$fips[yearlyTotals$fips=="24510"] <- "Baltimore, MD"
yearlyTotals$fips[yearlyTotals$fips=="06037"] <- "Los Angeles, CA"

png("plot6.png", width=1040, height=480)
g <- ggplot(yearlyTotals, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity")  +
  xlab("Year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicles in Baltimore City, MD vs Los Angeles, CA 1999-2008')
print(g)
dev.off()