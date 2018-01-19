
##load NEI and SCC file
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##plot 6, comparison of motor emission between Baltimore and LA
  ##subset and summarise total motor emission of Baltimore and LA
    motorEmission = filter(NEI, (fips == "24510"|fips == "06037") & type == "ON-ROAD")
    sumEmission6 = summarise(group_by(motorEmission, year, fips), Emissions = sum(Emissions))
    sumEmission6$city[sumEmission6$fips == "24510"] = "Baltimore"
    sumEmission6$city[sumEmission6$fips == "06037"] = "Los Angeles"
  ##generate plot in png file  
    png("plot6.png")
    ggplot(sumEmission6,
           aes(
             x = factor(year),
             y = Emissions,
             fill = city,
             label = round(Emissions, 2)
           )) +
      geom_bar(stat = "identity") +
      facet_grid(city ~ ., scales = "free") +
      xlab("Year") + ylab("Total Emissions(tons)") +
      ggtitle("Total Motor Emissions in Baltimore and Los Angeles") +
      geom_label(aes(fill = city), colour = "black")
    dev.off()