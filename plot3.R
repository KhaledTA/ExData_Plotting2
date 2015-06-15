library(ggplot2)

# Loads RDS
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

# Subsets data
# Baltimore City, Maryland == fips
baltimore <- NEI[NEI$fips == "24510",]
baltimore <- aggregate(Emissions ~ year + type, data=baltimore, sum)

# Drawing the graph and closing the graphic device
plot <- qplot(year, Emissions, data=baltimore, color=type, 
              geom="path", 
              main="Emissions By Type In Baltimor", 
              xlab="Year", 
              ylab="Emissions")

# Saving the plot to the png file before closing the devince 
ggsave(plot, file="plot3.png", width=9, height = 6)
