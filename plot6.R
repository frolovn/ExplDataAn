NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

veh <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vSCC <- SCC[veh,]$SCC
vNEI <- NEI[NEI$SCC %in% vSCC,]
bNEI <- vNEI[vNEI$fips=="24510",]
lNEI <- vNEI[vNEI$fips=="06037",]

totalb <- aggregate(Emissions ~ year,bNEI, sum)
par(mfrow=c(1,2))
plot(totalb, pch=15, col="red", xlab="Year", ylab="Emissions", ylim=c(1, 8000), main="Motor Emissions, Baltimore")
lines(totalb, col="red")
totall <- aggregate(Emissions ~ year,lNEI, sum)
plot(totall, pch=15, col="blue", xlab="Year", ylab="Emissions", ylim=c(1, 8000), main="Motor Emissions, LA")
lines(totall, col="blue")

dev.copy(png,'plot6.png')
dev.off()