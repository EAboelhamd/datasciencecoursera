## practice exmaple 

## reading file .. 
data <- read.table("file name")

dim(data)

head(data)

cnames <- names("header") ## to check the columns names 


cnames <- strsplit(cnames, "|", fixed = TRUE)  ## to split the header, where | is the seperator

x0 <- pm0$column1  ## to assign the 1st column of the data in another vector

mean(is.na(x0))  ## to check missing values percentage

### plotting boxplots ..
boxplot(x0, x1) ## to plot them on the same grid
# if it is unclrear to check the plot due to outliers .. take the log !

boxplot(log10(x0), log10(x1))  ## britty good !

## to assign all the negative values of x1 in another variable ..
negative <- x1 < 0

## to sum number of negative values .. 
sum(negative, na.rm = TRUE)

intersect(site0, site1)  ## to check if two variables are similar to each other 

sapply(split(cnt0, cnt0$county.site), nrow)  ## this will split cnt0 into several data frames according the county.site


abline(h = median(x0sub, na.rm = TRUE), lwd = 2) ## another call to abline with NAs taken into consideration