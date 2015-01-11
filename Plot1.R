library(data.table)
house_energy = fread("C:\\Users\\Wu\\Downloads\\household_power_consumption.txt")
house_cut <- house_energy[house_energy$Date == '1/2/2007' | house_energy$Date == '2/2/2007',]
par(bg = "white")
hist(as.numeric(house_cut$Global_active_power), col = "red", 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, "Plot1.png")
dev.off()
