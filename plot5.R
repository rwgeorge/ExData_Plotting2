## plot5.R
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
sourceClassificationCodeData <- tbl_df(readRDS("Source_Classification_Code.rds"))

sourceClassificationCode <- filter(sourceClassificationCodeData, grepl("Vehicle", SCC.Level.Two, ignore.case = TRUE))
nationalEmissionsInventory <- filter(nationalEmissionsInventoryData, SCC %in% sourceClassificationCode$SCC & fips == "24510")
nationalEmissionsInventory <- group_by(nationalEmissionsInventory, year)
nationalEmissionsInventory <- summarise(nationalEmissionsInventory, sum(Emissions))
names(nationalEmissionsInventory) <- c("Year", "Emissions")

## Set Parameters
par(mfrow = c(1, 1))

## Open Graphics Device
png(file = "plot5.png")

## Plot
thePlot <- with(nationalEmissionsInventory, qplot(Year, Emissions))
thePlot + geom_line()
dev.off()