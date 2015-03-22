## plot1.R
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

## Check to see if total emissions from PM2.5 decreased in the United States 
## from 1999 to 2008. Using the base plotting system, make a plot showing the 
## total PM2.5 emission from all sources for each of the years 1999, 2002, 2005,
## and 2008.
nationalEmissionsInventoryData <- group_by(nationalEmissionsInventoryData, year)
nationalEmissionsInventoryData <- summarise(nationalEmissionsInventoryData, sum(Emissions))
names(nationalEmissionsInventoryData) <- c("Year", "Emissions")

## Set Parameters
par(mfrow = c(1, 1))

## Open Graphics Device
png(file = "plot1.png")

## Plot
with(nationalEmissionsInventoryData, plot(year, Emissions, type = "l"))
dev.off()