## simple example ..

library(ggplot2)

## this version deosn't plot the smoother !
qplot(displ, hwy, data = mpg, geom = "point")   ## add smoother line to the plot
geom_smooth(data = mpg, stat = "smooth", method = "auto", formula = displ ~ hwy)


## another trail .. works well 
ggplot(mpg, aes(displ, hwy)) + geom_point() + geom_smooth()
# the + sign is used to add objects to the plot 

qplot(displ, hwy, data = mpg, color = drv) ## add color to the plot

##-----------------------------------------------------------------------

## histogram plot ..

qplot(hwy, data = mpg, fill = drv)   ## add smoother line to the plot
## this plots a histogram for the three types of cars overlayed !

## --------------------------------

## facets .. like panels in lattice (multiple plots within the same panel)
qplot(displ, hwy, data = mpg, facets = .~drv) ## three seperate scatter plots

##another way ..
qplot(hwy, data = mpg, facets = drv~., binwidth = 2) ## three seperate hist plots 

###-------------------------------------
## loading data
env <- readRDS("/home/eman/Coursera/Exploratory Data Analysis/maacs_env.rds")
id <- 1:750
maacs <- data.frame(id, maacs, env)
maacs <- maacs[c("id", "eno", "duBedMusM", "pm25", "mopos")]
save(maacs, file = "/home/eman/Coursera/Exploratory Data Analysis/maacs2.Rda" )

head(maacs)

##plotting ..

head(maacs)
qplot(log(pm25), mopos, data = maacs, facets = .~ mopos, geom = c("point", "smooth"), method = "lm")

## let's try ggplot
g <- ggplot(maacs, aes(log(pm25), mopos))
summary(g) 
print(g) ## only an empty grid is there

p <- g + geom_point()
print(p) ## points are added to the plot 

g + geom_point() + geom_smooth()

## adding linear model ..
g + geom_point() + geom_smooth(method = "lm")

## adding facets to the plot ..
g + geom_point() + facet_grid(. ~ mopos) + geom_smooth(method = "lm")

## facet .. as if to be the confounding variable ..

## customize your plot
g + geom_point() + facet_grid(. ~ mopos) + geom_smooth(method = "lm")
g + geom_point(color = "steelblue", size = 4, alpha = 1/2)
## the defualt size is 1 
## alpha is the width of the plotted circles 
## static color

g + geom_point(aes(color = mopos), size = 4, alpha = 1/2)
# color differs according to the color of the variable 


## adding labels ..
g + geom_point() + geom_point(aes(color = mopos))  + labs(title = "MAACS Cohors") + labs(x = expression("log"*PM[2.5]) , y = "mopos")

## adding more thikker line .. through .. se = false, linetype =3 detremines the type of the line .. i.e. square
g + geom_point() + geom_point(aes(color = mopos), size = 2, alpha = 1/2) + geom_smooth(size = 4, linetype = 3, method = "lm", se = FALSE)  


## chaning the overall them 
g + geom_point(aes(color = mopos)) + theme_bw(base_family = "Times")
 
## --------------------------------------------------------------------

## adjusting the axis ..
## in test data 
testdat <- data.frame(x = 1:100, y = rnorm(100))
testdat[50, 2] <- 100  ## introducing outlier 
plot(testdat$x, testdat$y, type = "l", ylim = c(-3, 3))
# now if i want to focus on that outlier and highlight is on the plot ..
g <- ggplot(testdat, aes(x = x, y = y))
g + geom_line()


g + geom_line() + ylim(-3, 3)

g + geom_line() + coord_cartesian(ylim = c(-3, 3))

## cut() funtion to discritize the data .. 
## this is used if u wanna depend on numerical variable in creating differnt subplots

cutpoints <- quantile(maacs$pm25, seq(0, 1, length = 4), na.rm = TRUE) ## nomber of intervals = length -1

maacs$eno <- cut(maacs$pm25, cutpoints)

levels(maacs$eno)

## ----------------------------------------
## customize the plot .. but it is not run !
g <- ggplot(maacs, aes(log(pm25), mopos))

g + geom_point(alpha = 1/3) 
  + geom_smooth(method = "lm", se = FALSE, col = "Steelblue")
  + labs(title = "MAACS Cohors") 
  + labs(x = expression("log"*PM[2.5]))
  + labs(y = "mopos")
##+ theme_bw(base_family = "Avenir", base_size = 10)
##+ facet_wrap(mopos ~ eno, nrow = 2, ncol = 4)

