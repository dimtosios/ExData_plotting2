setwd("C:/Users/dimitris/Desktop/R programming/exdata/project2")
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
baltimore <- subset(NEI, fips == "24510")
aggdata<-aggregate(Emissions~year+type,baltimore,sum)

png("plot3.png")
g <- ggplot(aggdata, aes(year, Emissions, color = type))
g <- g + geom_line() +
      xlab("year") +
      ylab(expression('Total PM'[2.5]*" Emissions")) +
      ggtitle('Total Emissions in Baltimore City from 1999 to 2008')
print(g)
dev.off()
