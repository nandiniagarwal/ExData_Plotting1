library("data.table")



power_dt <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)

power_dt[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]


power_dt[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]


power_dt <- power_dt[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("Plot1.png", width=480, height=480)

hist(power_dt[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (Kilowatts)", ylab="Frequency", col="Red")

dev.off()
