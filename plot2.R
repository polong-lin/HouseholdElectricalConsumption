#Read data from rows 65000 to 70000, which encompass 2007-02-01 and 2007-02-02, no Headers
df <- read.table("household_power_consumption.txt", skip = 65000, nrows = 5000, header = FALSE, sep = ";")
df <- df[df[,1] %in% c("1/2/2007","2/2/2007"),]

#Add headers from the file
vars <- unlist(strsplit(readLines("household_power_consumption.txt", n = 1), ";"))
names(df) <- vars

#Create column, datetime, that combines Date and Time
df$Date <- as.character(df$Date)
df$Time <- as.character(df$Time)
df$Datetime <- strptime(paste(df$Date,df$Time), format = "%d/%m/%Y %H:%M:%S")

#Create column, Weekday, column for week day
df$Weekday <- as.factor(weekdays(as.Date(df$Datetime)))


###########
# Plot 2  #
###########

plot(df$Datetime, df$Global_active_power, type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     cex.axis = 0.72,
     cex.lab = 0.72,
     bg = "transparent")


#Save as PNG
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
  
