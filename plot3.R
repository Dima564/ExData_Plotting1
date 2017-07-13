library(data.table)
library(dplyr)
library(ggplot2)


dates = c("1/2/2007", "2/2/2007")
data <- fread("household_power_consumption.txt", na.strings=c('?'))
data <- data %>% subset(Date %in% dates) %>% mutate(datetime = as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))


p <- ggplot(data, aes(datetime)) + 
  geom_line(aes(y = Sub_metering_1, colour = "Sub_metering_1")) + 
  geom_line(aes(y = Sub_metering_2, colour = "Sub_metering_2")) + 
  geom_line(aes(y = Sub_metering_3, colour = "Sub_metering_3")) + 
  theme(legend.title=element_blank()) + 
  labs(y="Energy sub metering", x=element_blank())

print(p)