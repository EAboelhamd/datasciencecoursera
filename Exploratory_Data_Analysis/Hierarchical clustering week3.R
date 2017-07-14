## Example on measuring distances types .. i.e. eucledian dist, manhattan dist ..

set.seed(1234)
par(mar = c(0, 0, 0, 0))
x <- rnorm(12, mean = rep(1:3, each = 4), sd = 0.2)
# each ==> non-negative integer. Each element of x is repeated each times. 
          #Other inputs will be coerced to an integer or double vector and the first element taken. 
          #Treated as 1 if NA or invalid.
          # i.e. number of generated points each time


y <- rnorm(12, mean = rep(c(1, 2, 1), each = 4), sd = 0.2)
## c(1, 2, 1): this one determines the position of the points .. to form a cluster
plot(x, y, col = "blue", pch = 19, cex = 2)

text(x + 0.05, y + 0.05, labels = as.character(1:12))


dataFrame <- data.frame(x = x, y = y)
dataFrame
distxy <- dist(dataFrame) ## distance matrix

## clustering and plotting dendogram 
hClustering <- hclust(distxy)
plot(hClustering)


## plotting prettier dendograms ..
myplclust <- function(hclust, lab = hclust$labels, lab.col = rep(1, length(hclust$labels)), hang = 0.1, ...)
{
  y <- rep(hclust$height, 2)
  x <- as.numeric(hclust$merge)
  y <- y[which(x < 0)]
  x <- x[which(x < 0)]
  x <- abs(x)
  y <- y[order(x)]
  x <- x[order(x)]
  plot(hclust, labels = FALSE, hang = hang, ...)
  text(x = x, y = y[hclust$order] - (max(hclust$height)*hang), labels = lab[hclust$order], col = lab.col[hclust$order], str = 90, adj = c(1, 0.5), xpd = NA, ...)
}

myplclust(hClustering, lab = rep(1:3, each = 4), lab.col = rep(1:3, each = 4)) ## is not work properly ! .. expected to plot colored clusters

## ------------------------------------------------

## heatmap function ..
## to visualize the data in a shape of horizontal dendogram 
## it runs hierarchical clustering on a rows of the table then the columns of the table ..

dataFrame <- data.frame(x = x, y = y)
dataFrame
set.seed(143)
dataMatrix <- as.matrix(dataFrame)[sample(1:12),]
dataMatrix
heatmap(dataMatrix)

## to check the plotting results ..
plot(dataMatrix[,1], dataMatrix[,2], col = "blue", pch = 19, cex = 2)
text(x + 0.05, y + 0.05, labels = as.character(1:12))

## end of lesson # 1
