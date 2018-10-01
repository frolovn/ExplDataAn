NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

bNEI <- NEI[NEI$fips=="24510",]
total <- aggregate(Emissions ~ year,bNEI, sum)
plot(total, pch=15, col="red", xlab="Year", ylab="Emissions", main="Total PM2.5 Emissions, Baltimore")
lines(total)
dev.copy(png,'plot2.png')
dev.off()