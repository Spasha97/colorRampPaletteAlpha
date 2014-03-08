# addalpha() and colorRampPaletteAlpha() usage examples
# Myles Harrison
# www.everydayanalytics.ca

library(MASS)
library(RColorBrewer)
# Source the colorRampAlpha filea
source ('colorRampPaletteAlpha.R')

# addalpha()
# ----------
# scalars:
col1 <- "red"
col2 <- rgb(1,0,0)
addalpha(col2, 0.8)
addalpha(col2,0.8)

# scalar alpha with vector of colors:
col3 <- c("red", "green", "blue", "yellow")
addalpha(col3, 0.8)
plot(rnorm(1000), col=addalpha(brewer.pal(11,'RdYlGn'), 0.5), pch=16)

# alpha and colors vector:
alpha <- seq.int(0, 1, length.out=4)
addalpha(col3, alpha)

# Simple example
x <- seq.int(0, 2*pi, length=1000)
y <- sin(x)
plot(x, y, col=addalpha(rep("red", 1000), abs(sin(y))))

# with RColorBrewer
x <- seq.int(0, 1, length.out=100)
z <- outer(x,x)
c1 <- colorRampPalette(brewer.pal(11, 'Spectral'))(100)
c2 <- addalpha(c1,x) 
par(mfrow=c(1,2))
image(x,x,z,col=c1)
image(x,x,z,col=c2)

# colorRampPaletteAlpha()
# Create normally distributed data
x <- rnorm(1000)
y <- rnorm(1000)
k <- kde2d(x,y,n=250)

# Sample colors with alpha channel
col1 <- addalpha("red", 0.5)
col2 <-"green"
col3 <-addalpha("blue", 0.2)
cols <- c(col1,col2,col3)

# colorRampPalette ditches the alpha channel
# colorRampPaletteAlpha does not
cr1 <- colorRampPalette(cols)(32)
cr2 <- colorRampPaletteAlpha(cols, 32)

par(mfrow=c(1,2))
plot(x, y, pch=16, cex=0.3)
image(k$x,k$y,k$z,col=cr1, add=T)
plot(x, y, pch=16, cex=0.3)
image(k$x,k$y,k$z,col=cr2, add=T)

# Linear vs. spline interpolation
cr1 <- colorRampPaletteAlpha(cols, 32, interpolate='linear') # default
cr2 <- colorRampPaletteAlpha(cols, 32, interpolate='spline')
plot(x, y, pch=16, cex=0.3)
image(k$x,k$y,k$z,col=cr1, add=T)
plot(x, y, pch=16, cex=0.3)
image(k$x,k$y,k$z,col=cr2, add=T)
