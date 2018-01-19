    
    
##load NEI and SCC file
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
    
##plot 1, total emissions by year
  ##summarise the total emissions by year
    sumEmission1 = summarise(group_by(NEI, year), Emissions = sum(Emissions))
  ##generate plot in png file
    png("plot1.png")
    barplot = barplot(
    height = round(sumEmission1$Emissions / 1000, 2),
    names.arg = sumEmission1$year,
    col = "blue",
    ylim = c(0, 8000),
    ylab = "Total Emissions(kilotons)",
    xlab = "Years",
    main = "Total Emissions by years"
    )
    text(
    x = barplot,
    y = round(sumEmission1$Emissions / 1000, 2),
    label = round(sumEmission1$Emissions / 1000, 2),
    pos = 3,
    col = "black"
    )
    dev.off()

    
