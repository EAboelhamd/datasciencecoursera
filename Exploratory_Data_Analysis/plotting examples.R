## plotting examples

x <- rnorm(100)
hist(x)


y <- rnorm(100)

plot(x, y)


## u can adjust the margins of the plot
par(mar = c(4, 4, 2, 2))
plot(x, y, pch = 2)  #replace circles by regtancles 

## ----------------------------------------------------- ##
## show list of set of capabilities of par
example(points)
points <- require(stats)
#points <- plot(-4:4, -4:4, type = "n")
points(rnorm(200), rnorm(200), col = 'red') 
###------------------------------- ############

## multiple subplots ..
z <- rnorm(100)
par(mfrow = c(2, 1))
plot(x, y, pch = 20)
plot(x, z, pch = 1)

## adjust margins
par(mfrow = c(2, 1))
per(mar = c(2, 2, 1, 1))
plot(x, y, pch = 20)
plot(x, z, pch = 1)


##########  creating groups of data ############
x <- rnorm(100)
y <- rnorm(100)

g <- gl(2, 50)
g <- gl(2, 50, labels = c("Males", "Females"))
str(g)
## setup the plot region 
plot(x, y, type = "n")  ## no data yet!

points(x[g == "Males"], y[g == "Males"], col = "green")  ## males data are plotted in green
points(x[g == "Females"], y[g == "Females"], col = "red")  ## males data are plotted in green
title("Males Vs Females")
