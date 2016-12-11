setwd("C:/Users/dimitris/Desktop/R programming/exdata/project2")

NEI <- readRDS("summarySCC_PM25.rds")
baltimore <- subset(NEI, fips == "24510")
aggdata<-aggregate(Emissions~year,baltimore,sum)

png('plot2.png')

barplot(height=aggdata$Emissions, names.arg=aggdata$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' in the Baltimore City emissions at various years'))

dev.off()