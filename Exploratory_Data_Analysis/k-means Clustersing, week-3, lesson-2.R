## k means ..
## intialize data points ..
set.seed(1234)
par(mar = c(0, 0, 0, 0))
x <- rnorm(12, mean = rep(1:3, each = 4), sd = 0.2)
y <- rnorm(12, mean = rep(c(1, 2, 1), each = 4), sd = 0.2)
plot(x, y, col = "blue", pch = 19, cex = 2)
text(x + 0.05, y + 0.05, labels = as.character(1:12))

## k means algorithm in R
dataFrame <- data.frame(x, y)
kmeansObj <- kmeans(dataFrame, centers =3)
names(kmeansObj) # props of this object

## lets check what's inside cluster property..
kmeansObj$cluster ## three clusters 

kmeansObj$centers  ## position of the centers

kmeansObj$iter  # only two iterations

# -------------------------------
par(mar = c(0.2, 4)) ## it is more correct to be rep(0.2, 4)
plot(x, y, col = kmeansObj$cluster, pch = 19, cex = 2)
points(kmeansObj$centers, col = 1:3, pch = 3, cex = 3, lwd= 3)

## heatmaps ..
set.seed(1234)
dataMatrix <- as.matrix(dataFrame)[sample(1:12),]
dataMatrix
kmeansObj2 <- kmeans(dataMatrix, centers = 3)
kmeansObj2
par(mfrow = c(1, 2), mar = c(2, 4, 0.1, 0.1))
image(t(dataMatrix) [, nrow(dataMatrix):1], yaxt = "n")
image(t(dataMatrix)[, order(kmeansObj$cluster)], yaxt = "n")
## end of the lesson