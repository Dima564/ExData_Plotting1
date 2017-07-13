library(data.table)
library(dplyr)
library(ggplot2)


dates = c("1/2/2007", "2/2/2007")
data <- fread("household_power_consumption.txt", na.strings=c('?'))
data <- data %>% subset(Date %in% dates) %>% mutate(datetime = as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

p <- ggplot(data=data, aes(x=datetime, y=Global_active_power)) + 
  geom_line(linetype = "solid") + 
  labs(y="Global Active Power (kilowatts)", x=element_blank())
print(p)