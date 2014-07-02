## Load the libraries required to run this script
library(sqldf)
## Load the data required for the project 1
## Load only the data that contains dates 2/1/2007 and 2/2/2007
## Total of 2880 obsercations of 9 variables
## Make sure that the project file is unzipped and placed in current working directory
## (This script assumes that the unzipped project file is located at Current Working Directory)
data <- read.csv.sql(file="household_power_consumption.txt",sql="select * from file where Date in ('1/2/2007','2/2/2007')",header=TRUE,sep=";")

## Combine the Date and Time variables in the data frame and create a new DateTime variable
data$DateTime <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")

## Plot 1
## The below code does the following
## opens a PNG graphics device with dimention 480x480 as required by the project
## Creates the required plot and saves the plot to graphics device ( PNG in our case)
## The PNG file will be saved in the current working directory

png(filename="plot1.png",width=480,height=480)
with(data,hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)"))
dev.off()