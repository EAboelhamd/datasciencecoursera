## simple scatterplot
library(lattice)
library(datasets)

xyplot(Ozone ~ Wind, data = airquality)

## multivariate data 
airquality <- transform(airquality, Month = factor(Month)) #select month variable
xyplot(Ozone ~ Wind | Month, data = airquality, layout = c(5, 1))


## panel function 
## helps me to plot multiple plots within the same plot
set.seed(10)
x <- rnorm(100)
f <- rep(0:1, each = 50)
y <- x + f - f*x + rnorm(100, sd = 0.5)
f <- factor(f, labels = c("Group 1", "Group 2"))
xyplot(y ~ x | f, layout = c(2, 1))

## custom panel function 
## helps in customizing the plot
xyplot(y ~ x | f, panel = function(x, y, ...)
{
  panel.xyplot(x, y, ...)
  panel.abline(h = median(y), lty = 2)
})

## I also can add a regression line 
xyplot(y ~ x | f, panel = function(x, y, ...)
{
  panel.xyplot(x, y, ...)
  panel.lmline(x, y, col = 2)
})

## end of  1st lesson in week # 2