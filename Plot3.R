setwd("C:/Users/aaron.bench1/Documents/AaronBench/R_Files and Data/Coursera/Power")

#Ingest data as table

powerd <- read.table("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE, dec = ".", header = TRUE)

# Subset data

subpower <- powerd[powerd$Date %in% c("1/2/2007","2/2/2007") ,]


#date and time variable

datetime <- strptime(paste(subpower$Date, subpower$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#convert sum-metering to numeric

globalActivePower <- as.numeric(subpower$Global_active_power)
subMetering1 <- as.numeric(subpower$Sub_metering_1)
subMetering2 <- as.numeric(subpower$Sub_metering_2)
subMetering3 <- as.numeric(subpower$Sub_metering_3)

#create plot

png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()

