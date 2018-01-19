
##load NEI and SCC file
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


##plot 2, total emissions by year of Baltimore
  ##subset and summarise the total emissions by year in Baltimore
    subBaltimore = filter(NEI, fips == "24510")
    sumEmission2 = summarise(group_by(subBaltimore, year), Emissions = sum(Emissions))
  ##generate plot in png file
    png("plot2.png")
    barplot = barplot(
      height = sumEmission2$Emissions,
      names.arg = sumEmission2$year,
      col = "red",
      ylim = c(0, 4000),
      ylab = "Total Emissions(tons)",
      xlab = "Years",
      main = "Total Emissions by years in Baltimore"
    )
    text(
      x = barplot,
      y = sumEmission2$Emissions,
      label = round(sumEmission2$Emissions, 2),
      pos = 3,
      col = "black"
    )
    dev.off()