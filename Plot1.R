setwd("C:/Users/aaron.bench1/Documents/AaronBench/R_Files and Data/Coursera/Power")

#Ingest data as table 

powerd <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

#subset data for Feb 1st and 2nd of 2007

subpower<-powerd[powerd$Date %in% c("1/2/2007","2/2/2007"),]


png("plot1.png", width=480, height=480)

with(subpower, 
     hist(as.numeric(levels(Global_active_power))[Global_active_power],
          col="red", 
          main="Global Acvtive Power",
          xlab="Global Active Power (kilowatts)"))





dev.off()
