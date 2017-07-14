## list of built in functions ..

colors()
colorRamp(c("red", "blue"))  #numbers from 0 to 255 
colorRampPalette(c("red", "blue")) #hex. format
RColorBrewer # library then ..
brewer.pall(3, "BuGn") ## BlueGreen .. color name and number of diff. colors needed
## to create your own palettes .. you can use one of these built in palettes
## sequential ==> used for numerical data (ordered from low to high)
## Diverging ==> diversed data i.e. if u want to show the divergance in the data from -ve to +ve
## Qualitative ==> fact data .. numerical but not ordered or even categorical data

## --------------------

## we also have 
smoothScatter()  ## to plot scatter than has lots of data points but u want them to overlap, inputs ==> (x, y)