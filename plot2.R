#plot2.R
##Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶") from 1999 to 2008? Use the base plotting system to make a plot answering this quest

##load data 
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

##get subset for Baltimore
baltimoreNEI <- NEI[NEI$fips=="24510", ]

##Aggregate total emissions by year
yearlyTotals<- aggregate(Emissions ~ year, baltimoreNEI, sum)

##create plot
png('plot2.png')
barplot(height=yearlyTotals$Emissions, names.arg=yearlyTotals$year, xlab="Year", ylab=expression('Total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions in Baltimore City, MD  1999-2008'))
dev.off()