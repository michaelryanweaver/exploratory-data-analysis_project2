#plot1.R
##Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

##load data 
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

yearlyTotals <- aggregate(Emissions ~ year, NEI, sum)

png('plot1.png')
barplot(height=yearlyTotals$Emissions, names.arg=yearlyTotals$year, xlab="Year", ylab=expression('Total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions 1999-2008'))
dev.off()