setwd("C:/Users/dimitris/Desktop/R programming/exdata/project2")
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
subsetNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]
aggdata <- aggregate(Emissions ~ year, subsetNEI, sum)

png("plot5.png")
g <- ggplot(aggdata, aes(factor(year), Emissions))

g <- g + geom_bar(stat="identity") +
      xlab("year") +
      ylab(expression('Total PM'[2.5]*" Emissions")) +
      ggtitle('Total Emissions from motor vehicle ( ON-ROAD) in Baltimore City from 1999 to 2008')
print(g)

dev.off()