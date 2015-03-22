## plot2.R
##
## Bob George  https://github.com/rwgeorge
###############################################################################
## Coursera Exploratory Data analysis (exdata-012)
## Course Project 2
## https://github.com/rwgeorge/ExData_Plotting2
###############################################################################
library(dplyr)
library(tidyr)

## Load Data
nationalEmissionsInventoryData <- tbl_df(readRDS("summarySCC_PM25.rds"))

## Filter and Summarize Data
nationalEmissionsInventoryData <- filter(nationalEmissionsInventoryData, fips == 24510)
nationalEmissionsInventoryData <- group_by(nationalEmissionsInventoryData, year)
nationalEmissionsInventoryData <- summarise(nationalEmissionsInventoryData, sum(Emissions))
names(nationalEmissionsInventoryData) <- c("Year","Emissions")

## Set Parameters
par(mfrow = c(1, 1))

## Open Graphics Device
png(file = "plot2.png")

## Plot
with(nationalEmissionsInventoryData, plot(Year, Emissions, type = "l"))
dev.off()