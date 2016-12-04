# --------------------------------------
# 0. Initialization
# --------------------------------------
# clear environment and set working directory
rm(list = ls())
setwd("C:/Users/Eric/Coursera/DataScience/4. Exploratory Data Analysis/")

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
png(filename = "plot2.png")
# make plot
with(df_plot, plot(datetime, Global_active_power, type = "l", main = "", xlab = "", ylab = "Global Active Power (kilowatts)"))
# close device
dev.off()

