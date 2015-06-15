# Loads RDS
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

# Subsets data and appends two years in one data frame
MD <- subset(NEI, fips == '24510')

# Aggregates
TotalEmissions <- aggregate(MD$Emissions, list(MD$year), FUN = "sum")

# Defining the bitmap graph filename and properties
png(filename = "plot2.png", width = 480, height = 480, units = "px")

# Drawing the graph and closing the graphic device
plot(TotalEmissions, type = "l", xlab = "Year", 
     main = "Total Emissions in Baltimore City from 1999 to 2008", 
     ylab = expression('Total PM'[2.5]*" Emission"))

dev.off()