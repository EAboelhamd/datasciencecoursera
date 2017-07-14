## load datasets .. 

SCC_ <- readRDS("/home/eman/Coursera/Exploratory Data Analysis/Project # 2/Source_Classification_Code.rds")
head(SCC_)

NEI <- readRDS("/home/eman/Coursera/Exploratory Data Analysis/Project # 2/summarySCC_PM25.rds")
head(NEI)

dim(NEI) ## size of the dataset  .. 6M+ records and 6 columns 

summary(NEI$Emissions)
boxplot(log10(NEI$Emissions))

summary(NEI$year)
 
table(NEI$year) ## only 4 years are there .. 1999    2002    2005    2008 


## ---------------------------------------------------------------------------
## question # 1 .. plotting the emission each year
## simple plot ..
plot(NEI$year, NEI$Emissions, pch = 20)

## histogram ..
emission_years <- tapply(NEI$Emissions, NEI$year, sum)
barplot (emission_years, main = "Total Emission per year", xlab = "Years", ylab = "Total Emission")

dev.copy(png, file = "/home/eman/Coursera/Exploratory Data Analysis/Project # 2/plot1.png", bg = "black")
dev.off()


## -------------------------------------------------------------------------
## question # 2 .. checking the total emission of Baltimore City
table(NEI$fips)
class(NEI$fips)
summary(NEI$fips)

desired_fips <- subset(NEI, NEI$fips == 24510)

dim(desired_fips)

emission_Baltimore <- tapply(desired_fips$Emissions, INDEX = desired_fips$year, sum)
barplot(emission_Baltimore,desired_fips$year , main = "Emissions in Baltimore", xlab = "Years", ylab = "Emissions")

dev.copy(png, file = "/home/eman/Coursera/Exploratory Data Analysis/Project # 2/plot2.png", bg = "black")
dev.off()


## -------------------------------------------------------------

## Question # 3: which of 4 types  have seen decreases in emissions from 1999–2008 for Baltimore City?
library(ggplot2)

names(NEI)
NEI$type

baltimore <- subset(NEI, NEI$fips == 24510)

ggplot(data = baltimore, aes(x = year, y = Emissions, fill = type)) + geom_bar(stat = "identity", position = "dodge")
## position="dodge" .. to make it a side-by-side plot vs. a stacked one

dev.copy(png, file = "/home/eman/Coursera/Exploratory Data Analysis/Project # 2/plot3.png", bg = "black")
dev.off()

## --------------------------------------------------------
## Question # 4, Across the United States, how have emissions from coal combustion-related sources changed

ggplot(data = NEI, aes(x = year, y = Emissions, fill = type)) + geom_bar(stat = "identity", position = "dodge")
dev.copy(png, file = "/home/eman/Coursera/Exploratory Data Analysis/Project # 2/plot4.png", bg = "black")
dev.off()

## ---------------------------------------------------------------

## Question # 5: How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
head(NEI)

## we gonna work on SCC data .. 
names(SCC_)
head(SCC$EI.Sector)

## categiorize the motor vehicles .. 
## 4 categories .. (Diesel Heavy, Diesel Light, Gasoline Heavy, Gasoline Light)
greps2 <- unique(grep("mobile",SCC$EI.Sector, ignore.case = TRUE, value = TRUE))
greps2

baltimore <- subset(NEI, NEI$fips == 24510)

## subset of SCC 
gaz_heavy <- subset(SCC_, EI.Sector %in% greps2[1])
gaz_light <- subset(SCC_, EI.Sector %in% greps2[2])
diesel_light <- subset(SCC_, EI.Sector %in% greps2[3])
diesel_heavy <- subset(SCC_, EI.Sector %in% greps2[4])

baltimore$SCC

## subset of baltimore
gazHeavy <- subset(baltimore, SCC %in% gaz_heavy$SCC)
gazLight <- subset(baltimore, SCC %in% gaz_light$SCC)
dieselLight <- subset(baltimore, SCC %in% gaz_light$SCC)
dieselHeavy <- subset(baltimore, SCC %in% diesel_heavy$SCC)

car1 <- data.frame(gazHeavy, vehicle = "Gaz Heavy")
car2 <- data.frame(gazLight, vehicle = "Gaz Light")
car3 <- data.frame(dieselLight, vehicle = "Diesel Light")
car4 <- data.frame(dieselHeavy, vehicle = "Diesel Heavy")

all_cars <- rbind(car1, car2, car3, car4)  # combines vector, matrix or data frame by rows
all_cars

ggplot(data = all_cars, aes(x = year, y = Emissions, fill = vehicle)) + geom_bar(stat = "identity", position = "dodge")

dev.copy(png, file = "/home/eman/Coursera/Exploratory Data Analysis/Project # 2/plot5.png", bg = "black")
dev.off()

## --------------------------------------------------------------------

## Question # 6: Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County.
California <- subset(NEI, NEI$fips == "06037")
California$SCC

## subset of baltimore
gazHeavy_ <- subset(California, SCC %in% gaz_heavy$SCC)
gazLight_ <- subset(California, SCC %in% gaz_light$SCC)
dieselLight_ <- subset(California, SCC %in% gaz_light$SCC)
dieselHeavy_ <- subset(California, SCC %in% diesel_heavy$SCC)

car1_ <- data.frame(gazHeavy_, vehicle = "Gaz Heavy")
car2_ <- data.frame(gazLight_, vehicle = "Gaz Light")
car3_ <- data.frame(dieselLight_, vehicle = "Diesel Light")
car4_ <- data.frame(dieselHeavy_, vehicle = "Diesel Heavy")

all_cars_ <- rbind(car1_, car2_, car3_, car4_)  # combines vector, matrix or data frame by rows
all_cars_

ggplot(data = all_cars_, aes(x = year, y = Emissions, fill = vehicle)) + geom_bar(stat = "identity", position = "dodge") + facet_grid(.~fips)


install.packages("gridExtra") 
library("gridExtra")
install.packages("cowplot")
library("cowplot")

## plot both within the same panel 
plot1 <- ggplot(data = all_cars_, aes(x = year, y = Emissions, fill = vehicle)) + geom_bar(stat = "identity", position = "dodge")  + labs(title = "California") 
plot2 <- ggplot(data = all_cars, aes(x = year, y = Emissions, fill = vehicle)) + geom_bar(stat = "identity", position = "dodge")  + labs(title = "Baltimore") 
plot_grid(plot1, plot2, ncol = 2, nrow = 1)

dev.copy(png, file = "/home/eman/Coursera/Exploratory Data Analysis/Project # 2/plot6.png", bg = "black")
dev.off()
