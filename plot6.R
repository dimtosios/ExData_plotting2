etwd("C:/Users/dimitris/Desktop/R programming/exdata/project2")
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
subsetNEI <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

aggdata <- aggregate(Emissions ~ year + fips, subsetNEI, sum)
aggdata$fips[aggdata$fips=="24510"] <- "Baltimore"
aggdata$fips[aggdata$fips=="06037"] <- "Los Angeles"

png("plot6.png", width=1040, height=480)

g <- ggplot(aggdata, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)

g <- g + geom_bar(stat="identity")  +
      xlab("year") +
      ylab(expression('Total PM'[2.5]*" Emissions")) +
      ggtitle('Total Emissions from motor vehicle (ON-ROAD) in Baltimore City vs Los Angeles 1999-2008')
print(g)

dev.off()