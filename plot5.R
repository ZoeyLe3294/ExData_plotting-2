
##load NEI and SCC file
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##plot 5, emissions from mobile in Baltimore
  ##subset and summarise total motor emissions in Baltimore
    motorBal = filter(NEI, fips == "24510" & type == "ON-ROAD")
    sumEmission5 = summarise(group_by(motorBal, year), Emissions = sum(Emissions))
  ##generate plot in png file
    png("plot5.png")
    barplot = barplot(
      height = sumEmission5$Emissions,
      names.arg = sumEmission5$year,
      col = "purple",
      ylim = c(0, 450),
      ylab = "Total Emissions(tons)",
      xlab = "Years",
      main = "Total Motor Emissions by years in Baltimore"
    )
    text(
      x = barplot,
      y = sumEmission5$Emissions,
      label = round(sumEmission5$Emissions, 2),
      pos = 3,
      col = "black"
    )
    dev.off()
