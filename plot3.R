## plot3.R
##
## Bob George  https://github.com/rwgeorge
###############################################################################
## Coursera Exploratory Data analysis (exdata-012)
## Course Project 2
## https://github.com/rwgeorge/ExData_Plotting2
###############################################################################
library(dplyr)
library(tidyr)
library(ggplot2)

## Load Data
nationalEmissionsInventoryData <- tbl_df(readRDS("summarySCC_PM25.rds"))

## Which four sources (point, nonpoint, onroad, nonroad) have seen decreases 
## in emissions from 1999–2008 for Baltimore City? Which have seen increases 
## in emissions from 1999–2008?
nationalEmissionsInventoryData <- filter(nationalEmissionsInventoryData, fips == 24510)
nationalEmissionsInventoryData <- group_by(nationalEmissionsInventoryData, year, type)
nationalEmissionsInventoryData <- summarise(nationalEmissionsInventoryData, sum(Emissions))
names(nationalEmissionsInventoryData) <- c("Year", "Type", "Emissions")

## Set Parameters
par(mfrow = c(1, 1))

## Open Graphics Device
png(file = "plot3.png")

## Plot
thePlot <- with(nationalEmissionsInventoryData, qplot(Year, Emissions, color = Type))
thePlot + geom_line()
dev.off()