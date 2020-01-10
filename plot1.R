library("data.table")
powerData <- data.table::fread(input = "household_power_consumption.txt" , na.strings="?")
# Change Date Variable to Date Class
powerData[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Filter data between 2007-02-01 and 2007-02-02
powerData <- powerData[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("plot1.png", width=480, height=480)


hist(powerData[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off();