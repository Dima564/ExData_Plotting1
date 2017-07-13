library(data.table)
library(dplyr)
library(ggplot2)


dates = c("1/2/2007", "2/2/2007")
data <- fread("household_power_consumption.txt", na.strings=c('?'))
data <- data %>% subset(Date %in% dates) %>% mutate(datetime = as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))


p1 <- ggplot(data=data, aes(x=datetime, y=Global_active_power)) + 
  geom_line(linetype = "solid") + 
  labs(y="Global Active Power", x=element_blank())

p2 <- ggplot(data, aes(datetime)) + 
  geom_line(aes(y = Sub_metering_1, colour = "Sub_metering_1")) + 
  geom_line(aes(y = Sub_metering_2, colour = "Sub_metering_2")) + 
  geom_line(aes(y = Sub_metering_3, colour = "Sub_metering_3")) + 
  theme(
    legend.key.size = unit(.25, "cm"),
    legend.text = element_text(size = 5),
    legend.title=element_blank(), 
    legend.position = c(.95, .95),
    legend.justification = c("right", "top"),
    legend.box.just = "right",
    legend.margin = margin(6, 6, 6, 6)) + 
  labs(y="Energy sub metering", x=element_blank())

p3 <- ggplot(data, aes(x=datetime, y=Voltage)) + geom_line(linetype="solid")

p4 <- ggplot(data=data, aes(x=datetime, y=Global_reactive_power)) + 
  geom_line(linetype = "solid")


multiplot(p1,p2,p3,p4, cols=2)
