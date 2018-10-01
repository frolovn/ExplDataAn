library("ggplot2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

ccomb <- (grepl("combustion", SCC$SCC.Level.One, ignore.case=TRUE) & 
            grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE))
cSCC <- SCC[ccomb,]$SCC
cNEI <- NEI[NEI$SCC %in% cSCC,]

ggplot(cNEI,aes(factor(year),Emissions)) + 
  geom_bar(stat="identity") + 
  labs(x="Year", y="Emissions") + 
  labs(title="Coal combustion-related emissions by year")

dev.copy(png,'plot4.png')
dev.off()