
##load NEI and SCC file
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##plot 3, total emissions by year and type of Baltimore
  ##subset and summarise total emission by year and type in Baltimore
    subBaltimore = filter(NEI, fips == "24510")
    sumEmission3 = summarise(group_by(subBaltimore, year, type), Emissions =
                           sum(Emissions))
  ##generate plot in png file
    png("plot3.png")
    ggplot(sumEmission3,
           aes(
             x = factor(year),
             y = Emissions,
             fill = type,
             label = round(Emissions, 2)
           )) +
      geom_bar(stat = "identity") +
      facet_grid(. ~ type) +
      xlab("Year") + ylab("Total Emissions(tons)") +
      ggtitle("Total Emissions in Baltimore by years in different types") +
      geom_label(aes(fill = type), colour = "black")
    dev.off()
