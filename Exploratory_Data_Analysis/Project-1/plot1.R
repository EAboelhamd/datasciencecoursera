## reading data 
household <- read.table("/home/eman/Coursera/Exploratory Data Analysis/Project # 1/household_power_consumption.txt", sep=";")
head(household)

dim(household)  # 2075260  9
names(household)

household$V1

names(household) <- c("date", "time", "global_active_power", "global_reactive_power", "voltage", "global_intensity", "sub_metering_1", "sub_metering_2", "sub_metering_3")

household$date[1:10]

household$time[1:10]

## check missing values 
sum(household == '?')  # number of missing value = 155874


## subset the date points 
household$DateTime<-paste(household$date, household$time)
head(household$DateTime)

household$DateTime<-strptime(household$DateTime, "%d/%m/%Y %H:%M:%S")

start<-which(household$DateTime==strptime("2007-02-01", "%Y-%m-%d"))
end<-which(household$DateTime==strptime("2007-02-02 23:59:00", "%Y-%m-%d %H:%M:%S"))
subset_data <- household[start:end,]
head(subset_data)
dim(subset_data)

## plotting ..
## plot 1

hist(as.numeric(as.character(subset_data$global_active_power)), col = 'red', xlab = 'Global Active Power (in kilowatt)', main = "Global Active Power")

## copy plot
dev.copy(png, file = "/home/eman/Coursera/Exploratory Data Analysis/Project # 1/plot1.png", bg = "black")
dev.off()

## -------------------------------------------------------------
### plot # 2

plot(subset_data$DateTime, as.numeric(as.character(subset_data$global_active_power)), xlab = '', ylab = 'Global Active Power (in kilowatt)', type = 'l')

## copy plot
dev.copy(png, file = "/home/eman/Coursera/Exploratory Data Analysis/Project # 1/plot2.png", bg = "black")
dev.off()

## -------------------------------------------------------------

### plot # 3

plot(subset_data$DateTime,  as.numeric(as.character(subset_data$sub_metering_1)), xlab = '', ylab = 'Energy sub meeting', type = 'l', col = 'black')
par(new=TRUE)
lines(subset_data$DateTime,  as.numeric(as.character(subset_data$sub_metering_2)), xlab = '', ylab = 'Energy sub meeting', type = 'l', col = 'red')
par(new=TRUE)
lines(subset_data$DateTime,  as.numeric(as.character(subset_data$sub_metering_3)), xlab = '', ylab = 'Energy sub meeting', type = 'l', col = 'blue')
legend('topright', legend=c("sub_metering_1", "sub_metering_2", "sub_metering_3"),
       col=c("black", "red", "blue"), lty = c(1,1,1))

## copy plot
dev.copy(png, file = "/home/eman/Coursera/Exploratory Data Analysis/Project # 1/plot3.png", bg = "black")
dev.off()

## -------------------------------------------------------
## plot#4

par(mfrow = c(2, 2), mar = c(4, 4, 4, 4))

plot(subset_data$DateTime, as.numeric(as.character(subset_data$global_active_power)), xlab = '', ylab = 'Global Active Power (in kilowatt)', type = 'l')
plot(subset_data$DateTime, as.numeric(as.character(subset_data$voltage)), xlab = "Datetime", ylab = 'Voltage', type = 'l')

plot(subset_data$DateTime,  as.numeric(as.character(subset_data$sub_metering_1)), xlab = '', ylab = 'Energy sub meeting', type = 'l', col = 'black')
par(new=TRUE)
lines(subset_data$DateTime,  as.numeric(as.character(subset_data$sub_metering_2)), xlab = '', ylab = 'Energy sub meeting', type = 'l', col = 'red')
par(new=TRUE)
lines(subset_data$DateTime,  as.numeric(as.character(subset_data$sub_metering_3)), xlab = '', ylab = 'Energy sub meeting', type = 'l', col = 'blue')
legend('topright', legend=c("sub_metering_1", "sub_metering_2", "sub_metering_3"),
       col=c("black", "red", "blue"), lty = c(1,1,1))

plot(subset_data$DateTime, as.numeric(as.character(subset_data$global_reactive_power)), xlab = "", ylab = 'global_reactive_power', type = 'l')


## plotting ..
dev.copy(png, file = "/home/eman/Coursera/Exploratory Data Analysis/Project # 1/plot4.png", bg = "black")
dev.off()


