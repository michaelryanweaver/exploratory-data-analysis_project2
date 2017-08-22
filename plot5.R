#plot5.R
##How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

##load data 
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

library(ggplot2)

# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

##get subset for Baltimore motor vehicle sources
baltimoreMotorNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

yearlyTotals <- aggregate(Emissions ~ year, baltimoreMotorNEI, sum)



png("plot5.png", width=840, height=480)
g <- ggplot(yearlyTotals, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("Year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicles in Baltimore City, Maryland 1999-2008')
print(g)
dev.off()