# Loads RDS
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")


# Coal-related SCC
coal <- grep("coal", SCC$Short.Name, ignore.case = TRUE)
coal <- SCC[coal, ]
coal <- NEI[NEI$SCC %in% coal$SCC, ]

# Coal total Emissions
TotalCoalEmissions <- aggregate(coal$Emissions, list(coal$year), FUN = "sum")

# Defining the bitmap graph filename and properties
png(filename = "plot4.png", 
    width = 480, height = 480, 
    units = "px")

# Drawing the graph and closing the graphic device
plot(TotalCoalEmissions, type = "l", xlab = "Year", 
     main = "Total Emissions From Coal Combustion-related\n Sources from 1999 to 2008", 
     ylab = expression('Total PM'[2.5]*" Emission"))

dev.off()