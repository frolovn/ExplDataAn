NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

total <- aggregate(Emissions ~ year,NEI, sum)
plot(total, pch=15, col="red", xlab="Year", ylab="Emissions", main="Total PM2.5 Emissions")
lines(total)
dev.copy(png,'plot1.png')
dev.off()