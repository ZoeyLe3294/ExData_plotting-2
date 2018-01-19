
##load NEI and SCC file
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##plot 4, emissions from coal accross US
  ##subset and summarise total coal emission
    coalSCC = SCC[grep("Coal", SCC$EI.Sector), 1]
    coalNEI = NEI[NEI$SCC %in% coalSCC,]
    sumEmission4 = summarise(group_by(coalNEI, year), Emissions = sum(Emissions))
  ##generate plot in png file  
    png("plot4.png")
    barplot = barplot(
      height = round(sumEmission4$Emissions / 1000, 2),
      names.arg = sumEmission4$year,
      col = "green",
      ylim = c(0, 800),
      ylab = "Total Emissions(kilotons)",
      xlab = "Years",
      main = "Total Coal Emissions by years"
    )
    text(
      x = barplot,
      y = round(sumEmission4$Emissions / 1000, 2),
      label = round(sumEmission4$Emissions / 1000, 2),
      pos = 3,
      col = "black"
    )
    dev.off()
