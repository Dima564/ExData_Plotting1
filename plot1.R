library(data.table)
library(dplyr)
library(ggplot2)


dates = c("1/2/2007", "2/2/2007")
data <- fread("household_power_consumption.txt", na.strings=c('?'))
data <- data %>% subset(Date %in% dates) %>% mutate(datetime = as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))
p <- qplot(data$Global_active_power, geom='histogram')
p <- p + labs(title="Global Active Power", x="Global Active Power (kilowatts)", y="Frequency")

print(p)