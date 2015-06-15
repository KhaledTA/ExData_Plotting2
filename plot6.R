
library(ggplot2)

# Loads RDS
#NEI <- readRDS("data/summarySCC_PM25.rds")
#SCC <- readRDS("data/Source_Classification_Code.rds")

# Subsets data
# Baltimore City, Los Angeles == fips
sources <- NEI[NEI$fips == "24510"|NEI$fips == "06037", ]
sources <- sources$SCC

# motor-related SCC
motorsData <- NEI[NEI$SCC %in% sources,]
motorsData <- NEI[NEI$fips %in% c("24510", "06037"),]
motorsData <- aggregate(Emissions ~ year + fips, data=motorsData, sum)

# Drawing the graph
plot <- qplot(year, Emissions, color=fips, data=motorsData, geom="path", 
              main="Comparison of Total Emissions From Motor\n Vehicle Sources in Baltimore City\n and Los Angeles County from 1999 to 2008", 
              xlab="Year", ylab="Emissions")

# Saving the plot to the png file
ggsave(plot, file="plot6.png", width=8, height=6)

