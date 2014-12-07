library(data.table)
house_energy = fread("C:\\Users\\Wu\\Downloads\\household_power_consumption.txt")
house_cut <- house_energy[house_energy$Date == '1/2/2007' | house_energy$Date == '2/2/2007',]
x <- 1:2880

par(mfrow=c(2,2))
par(cex.lab = 0.8, cex.axis = 0.8)

# Draw first chart
plot(x, as.numeric(house_cut$Global_active_power), pch = 26, 
     ylab = "Global Active Power", xaxt = "n", xlab = "")
lines(x, as.numeric(house_cut$Global_active_power))
axis(1, at=c(1,1440,2880),labels=c("Thu", "Fri", "Sat"))

# Draw second chart
plot(x, as.numeric(house_cut$Voltage), pch = 26, 
     ylab = "Voltage", xaxt = "n", xlab = "datetime")
lines(x, as.numeric(house_cut$Voltage))
axis(1, at=c(1,1440,2880),labels=c("Thu", "Fri", "Sat"))

# Draw third chart
plot(x, as.numeric(house_cut$Sub_metering_1), pch = 26, 
     ylab = "Energy sub metering", xaxt = "n", xlab = "")
lines(x, as.numeric(house_cut$Sub_metering_1))
lines(x, as.numeric(house_cut$Sub_metering_2), col = "red")
lines(x, as.numeric(house_cut$Sub_metering_3), col = "blue")
legend(900, 40, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1), col = c("black", "red", "blue"), bty = "n", cex = 0.75) 
axis(1, at=c(1,1440,2880),labels=c("Thu", "Fri", "Sat"))

# Draw fourth chart
plot(x, as.numeric(house_cut$Global_reactive_power), pch = 26, 
     ylab = "Global_reactive_power", xaxt = "n", xlab = "datetime")
lines(x, as.numeric(house_cut$Global_reactive_power))
axis(1, at=c(1,1440,2880),labels=c("Thu", "Fri", "Sat"))

dev.copy(png, "Plot4.png")
dev.off()