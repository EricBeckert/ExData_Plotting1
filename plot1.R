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
png(filename = "plot1.png")
# make plot
hist(df_plot$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
# close device
dev.off()

