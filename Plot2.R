setwd("C:/Users/aaron.bench1/Documents/AaronBench/R_Files and Data/Coursera/Power")

#Ingest data as table 

powerd <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

#subset data for Feb 1st and 2nd of 2007

subpower<-powerd[powerd$Date %in% c("1/2/2007","2/2/2007"),]

subpower$dateNtime<- strptime(paste(subpower$Date, subpower$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 




png("plot2.png", width=480, height=480)

with(subpower, plot(dateNtime, as.numeric(levels(Global_active_power))[Global_active_power], type="l", xlab="Time Range", ylab = "Global Acrtive Power (kilowatts)"))
        


dev.off()
