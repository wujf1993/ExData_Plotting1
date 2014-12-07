library(data.table)
house_energy = fread("C:\\Users\\Wu\\Downloads\\household_power_consumption.txt")
house_cut <- house_energy[house_energy$Date == '1/2/2007' | house_energy$Date == '2/2/2007',]
x <- 1:2880
par(bg = "white")
plot(x, as.numeric(house_cut$Sub_metering_1), pch = 26, 
     ylab = "Energy sub metering", xaxt = "n", xlab = "")
lines(x, as.numeric(house_cut$Sub_metering_1))
lines(x, as.numeric(house_cut$Sub_metering_2), col = "red")
lines(x, as.numeric(house_cut$Sub_metering_3), col = "blue")
legend(1700, 39.5, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1), col = c("black", "red", "blue")) 
axis(1, at=c(1,1440,2880),labels=c("Thu", "Fri", "Sat"))
dev.copy(png, "Plot3.png", width = 480, height = 480, units = "px")
dev.off()