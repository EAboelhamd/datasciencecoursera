?Devices  ## different plotting devices in R

## in general devices means the channel you want you plot to be sent to .. i.e. screen, pdf file ..
## either vector format or bitmap

## send the plot to a pdf file 
pdf(file = "/home/eman/Coursera/Exploratory Data Analysis/myplot.pdf")
with(faithful, plot(eruptions, waiting))
title(main = "Old Faithful geyser data")
dev.off()
## -------------------------------------------------##

dev.cur()  ## currently active device

## copy plot ..
library(datasets)
with(faithful, plot(eruptions, waiting))
title(main = "Old faithful geyser data")
dev.copy(png, file = "/home/eman/Coursera/Exploratory Data Analysis/geyserplot.png", bg = "black")
dev.off()

