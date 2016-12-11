setwd("C:/Users/dimitris/Desktop/R programming/exdata/project2")

NEI <- readRDS("summarySCC_PM25.rds")
baltimore <- subset(NEI, fips == "24510")
aggdata<-aggregate(Emissions~year,baltimore,sum)
png('plot2.png')

## plot data
plot(baltimore$year, baltimore$Emissions, type = "l", 
     main = "Total PM2.5 Emission in the Baltimore 1999-2008",
     xlab = "Year", ylab = "Emissions")
dev.off()