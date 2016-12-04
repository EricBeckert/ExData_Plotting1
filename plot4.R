# --------------------------------------
# 0. Initialization
# --------------------------------------
# clear environment and set working directory
rm(list = ls())
setwd("C:/Users/Eric/Coursera/DataScience/4. Exploratory Data Analysis/")
# switch to English locale (for graph datetime annotations)
Sys.setlocale("LC_TIME", "English")

# --------------------------------------
# 1. Read source file
# --------------------------------------
df_hpc <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, na.strings = "?")
# Subset for 2 days mentioned
df_plot <- subset(df_hpc, Date == "1/2/2007" | Date == "2/2/2007")
# Create datetime column
df_plot$datetime <- strptime(paste(df_plot$Date, df_plot$Time), "%d/%m/%Y %H:%M:%S")

# --------------------------------------
# 2. Produce plot
# --------------------------------------
# open device
png(filename = "plot4.png")
# grid 2x2, fill column wise
par(mfcol = c(2, 2))
# plot upper left
with(df_plot, plot(datetime, Global_active_power, type = "l", main = "", xlab = "", ylab = "Global Active Power (kilowatts)"))
# plot lower left
with(df_plot, plot(datetime, Sub_metering_1, type = "l", main = "", xlab = "", ylab = "Energy sub metering"))
with(df_plot, points(datetime, Sub_metering_2, type = "l", col = "red"))
with(df_plot, points(datetime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", lty=c(1,1,1), col = c("black", "red", "blue"))
# plot upper right
with(df_plot, plot(datetime, Voltage, type = "l", main = "", ylab = "Voltage"))
# plot lower right
with(df_plot, plot(datetime, Global_reactive_power, type = "l", main = ""))
# close device
dev.off()

