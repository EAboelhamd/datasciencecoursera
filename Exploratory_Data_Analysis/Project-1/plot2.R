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

## -------------------------------------------------------------
### plot # 2

plot(subset_data$DateTime, as.numeric(as.character(subset_data$global_active_power)), xlab = '', ylab = 'Global Active Power (in kilowatt)', type = 'l')

## copy plot
dev.copy(png, file = "/home/eman/Coursera/Exploratory Data Analysis/Project # 1/plot2.png", bg = "black")
dev.off()
