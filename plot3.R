library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

bNEI <- NEI[NEI$fips=="24510",]
ggplot(bNEI,aes(factor(year),Emissions,fill=type))  +
  geom_bar(stat="identity") + 
  facet_grid(.~type) + 
  labs(x="year", y="Emissions") + 
  labs(title="Emissions in Baltimore")

dev.copy(png,'plot3.png')
dev.off()