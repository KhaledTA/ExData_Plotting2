# Loads RDS
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

# motor-related SCC
motor <- grep("motor", SCC$Short.Name, ignore.case = TRUE)
motor <- SCC[motor, ]
motor <- NEI[NEI$SCC %in% motor$SCC, ]

# motor total Emissions
TotalMotorEmissions <- aggregate(motor$Emissions, list(motor$year), FUN = "sum")

# Defining the bitmap graph filename and properties
png(filename = "plot5.png", 
    width = 480, height = 480, 
    units = "px")

# Drawing the graph and closing the graphic device
plot(TotalMotorEmissions, type = "l", xlab = "Year", 
     main = "Total Emissions From Motor Vehicle Sources\n from 1999 to 2008 in Baltimore City", 
     ylab = expression('Total PM'[2.5]*" Emission"))

dev.off()