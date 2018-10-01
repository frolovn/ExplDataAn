NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

veh <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vSCC <- SCC[veh,]$SCC
vNEI <- NEI[NEI$SCC %in% vSCC,]
bNEI <- vNEI[vNEI$fips=="24510",]
total <- aggregate(Emissions ~ year,bNEI, sum)
plot(total, pch=15, col="red", xlab="Year", ylab="Emissions", main="Motor Vehicle Emissions, Baltimore")
lines(total)

dev.copy(png,'plot5.png')
dev.off()