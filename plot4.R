setwd("C:/Users/dimitris/Desktop/R programming/exdata/project2")
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEISCC <- merge(NEI, SCC, by="SCC")

coalMatches  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
subsetNEISCC <- NEISCC[coalMatches, ]

aggdata <- aggregate(Emissions ~ year, subsetNEISCC, sum)

png("plot4.png")
g <- ggplot(aggdata, aes(factor(year), Emissions))

g <- g + geom_bar(stat="identity") +
      xlab("year") +
      ylab(expression('Total PM'[2.5]*" Emissions")) +
      ggtitle('Total Emissions from coal sources from 1999 to 2008')

print(g)

dev.off()