setwd("C:/Users/dimitris/Desktop/R programming/exdata/project2")

NEI <- readRDS("summarySCC_PM25.rds")
aggdata<-aggregate(Emissions~year,NEI,sum)
png('plot1.png', width=480, height=480)

## plot data
plot(aggdata$year, aggdata$Emissions, type = "l", 
     main = "Total PM2.5 Emission in the US 1999-2008",
     xlab = "Year", ylab = "Emissions")
dev.off()
