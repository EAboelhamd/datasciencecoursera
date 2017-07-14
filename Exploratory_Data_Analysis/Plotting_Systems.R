## there are many plotting systems in R 
## 1. Base plot

library(datasets)
data("cars")
with(cars, plot(speed, dist))

## 2. Lattice system
library(lattice)
## case sensitive
state <- data.frame(state.x77, region = state.region)
xyplot(Life.Exp ~ Income | region, data = state, layout = c(4, 1)) ## cols then rows


## ggplot2 system
install.packages("ggplot2")  # run once

library(ggplot2) ##include the package
data(mpg)
qplot(displ, hwy, data = mpg)  ##displacement of the car or the mileage of that car

##-------------------------------------------------------------------##
## graphics and grGraphics as a base plotting system
library(datasets)
hist(airquality$Ozone)

with(airquality, plot(Wind, Ozone))

library(datasets)
airquality <- transform(airquality, Month = factor(Month))
boxplot(Ozone ~ Month, airquality, xlab = "Month", ylab = "Ozone (ppb)")
## other args for base graphics:
## lty ==> line type (dashed, dotted ..)
## lwy ==> line width 
## I can call the par function to check the defualt parameters
par("lty") ##"solid"
par("col") ##"black"
par("mar")  ## margin, down, left, top, right (clock wise)
par("mfrow") ##one row and one column

## -------------------------------------------------------------------------## 
## Anotations in base plot .. to customize your plot 
with(airquality, plot(Wind, Ozone))
title(main = "Ozone and Wind in New York City")

## or you can add title directly .. 
with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City"))
with (subset(airquality, Month == 5), points(Wind, Ozone, col = "blue"))
## show the data points related to May with Blue color


with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City"))
with (subset(airquality, Month == 5), points(Wind, Ozone, col = "blue"))
with (subset(airquality, Month != 5), points(Wind, Ozone, col = "red"))
legend("topright", pch = 1, col = c("blue", "red"), legend = c("May", "Other Months"))
## show the data points related to May with Blue color other months with red color

 
## add regression line to the plot 
with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City", pch =  20)) ## plot data 
model <- lm(Ozone ~ Wind, airquality)  # plot linear line representing the model
abline(model, lwd = 2)

## multiple base plots
par(mfrow = c(1, 2))
with(airquality, {
  plot(Wind, Ozone, main = "Ozone and Wind")
  plot(Solar.R, Ozone, main = "Ozone and Solar Radiation")
  }
  )

## another multiple plot with outer margin 
par(mfrow = c(1, 3), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(airquality, {
  plot(Wind, Ozone, main = "Ozone and Wind")
  plot(Solar.R, Ozone, main = "Ozone and Solar Radiation")
  plot(Temp, Ozone, main = "Ozone and Temperature")
  mtext("Ozone and Weather in New York", outer = TRUE)
}
)
