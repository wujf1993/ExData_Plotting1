library(data.table)
house_energy = fread("C:\\Users\\Wu\\Downloads\\household_power_consumption.txt")
house_cut <- house_energy[house_energy$Date == '1/2/2007' | house_energy$Date == '2/2/2007',]
x <- 1:2880
plot(x, as.numeric(house_cut$Global_active_power), pch = 26, 
     ylab = "Global Active Power (kilowatts)", xaxt = "n", xlab = "")
lines(x, as.numeric(house_cut$Global_active_power))
axis(1, at=c(1,1440,2880),labels=c("Thu", "Fri", "Sat"))
dev.copy(png, "Plot2.png")
dev.off()