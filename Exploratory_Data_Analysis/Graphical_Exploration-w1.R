pollution <- read.csv("/home/eman/Coursera/avgpm25.csv", colClasses = c("numeric", "character", "factor", "numeric", "numeric"))
head(pollution)

summary(pollution$pm25)


## boxplot 
boxplot(pollution$pm25, col = 'blue')
abline(h = 12) ## how many of the data are above and below 
## about 75% of the are below the line


## histgram plot
hist(pollution$pm25, col = 'green', breaks = 100)
rug(pollution$pm25)
abline(v = 12, lwd = 2) ## 75% of the data are to the left of this line

# If we gonna know how many data point are below the median
hist(pollution$pm25, col = 'green', breaks = 100)
rug(pollution$pm25)
abline(v = median(pollution$pm25), col = "magenta", lwd = 4)

## Bar plot .. for categorical data 
barplot(table(pollution$region), col = "wheat", main = "Number of Countries in each Region")
## we cannot plot without table() function .. error of ('height' must be a vector or a matrix) will be displayed

boxplot(pm25 ~ region, data = pollution, col = 'red')
## on avg east data is higher than west (higher median position)
## the spread of data in west is higher than east (higher num of outliers)
## the majority of the extream value of pm25 are in the west

##subplot 
## mfrow help ==> http://rfunction.com/archives/1538
par(mfrow = c(2,1), mar = c(4,4,2,1))
hist(subset(pollution, region == "east")$pm25, col = "green")
hist(subset(pollution, region == "west")$pm25, col = "green")
## eastern region on avg. has higher extream values but don't have outliers (-ve skewed)
## western ones is on avg. less but it has outliers (+ve skewed)

## scatter plt  -- basic plot
with(pollution, plot(latitude, pm25))
abline(h = 12, lwd = 2, lty = 2) ##lwd determines the width of the bar

## scatter plot .. add colors for each region
with(pollution, plot(latitude, pm25, col = region))
abline(h = 12, lwd = 2, lty = 2)  #black east and red west
#again east is more clustered

## multiple scatterplots ..
par(mfrow = c(1, 2), mar = c(5, 4, 2, 1))
with(subset(pollution, region == "west"), plot(latitude, pm25, main = "West"))
with(subset(pollution, region == "east"), plot(latitude, pm25, main = "East"))

## end of 1st lesson in Week#1

