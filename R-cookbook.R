set.seed(1234)
rating  <- rnorm(200)
head(rating)
#> [1] -1.2070657  0.2774292  1.0844412 -2.3456977  0.4291247  0.5060559

rating2 <- rnorm(200, mean=.8)
head(rating2)
#> [1] 1.2852268 1.4967688 0.9855139 1.5007335 1.1116810 1.5604624

cond <- factor( rep(c("A","B"), each=200) )
data <- data.frame(cond, rating = c(rating,rating2))

hist(rating)
hist(rating, breaks=8, col="#CCCCFF", freq=FALSE)

# Put breaks at every 0.6
boundaries <- seq(-3, 3.6, by=.6)
boundaries
#>  [1] -3.0 -2.4 -1.8 -1.2 -0.6  0.0  0.6  1.2  1.8  2.4  3.0  3.6

hist(rating, breaks=boundaries)


# Kernel density plot
plot(density(rating))

plot.multi.dens <- function(s)
{
  junk.x = NULL
  junk.y = NULL
  for(i in 1:length(s)) {
    junk.x = c(junk.x, density(s[[i]])$x)
    junk.y = c(junk.y, density(s[[i]])$y)
  }
  xr <- range(junk.x)
  yr <- range(junk.y)
  plot(density(s[[1]]), xlim = xr, ylim = yr, main = "")
  for(i in 1:length(s)) {
    lines(density(s[[i]]), xlim = xr, ylim = yr, col = i)
  }
}

# the input of the following function MUST be a numeric list
plot.multi.dens( list(rating, rating2))

library(sm)
sm.density.compare(data$rating, data$cond)
# Add a legend (the color numbers start from 2 and go up)
legend("topright", levels(data$cond), fill=2+(0:nlevels(data$cond)))


## Boxplots

head(ToothGrowth)
boxplot(len ~ supp, data=ToothGrowth)
boxplot(len ~ dose, data=ToothGrowth)
boxplot(len ~ interaction(dose,supp), data=ToothGrowth)
plot(len ~ interaction(dose,supp), data=ToothGrowth)

## Scatterplots

set.seed(955)
# Make some noisily increasing data
dat <- data.frame(xvar = 1:20 + rnorm(20,sd=3),
                  yvar = 1:20 + rnorm(20,sd=3),
                  zvar = 1:20 + rnorm(20,sd=3))

head(dat)

# Plot the points using the vectors xvar and yvar
plot(dat$xvar, dat$yvar)

# Same as previous, but with formula interface
plot(yvar ~ xvar, dat)

# Add a regression line
fitline <- lm(dat$yvar ~ dat$xvar)
abline(fitline)

#A scatterplot matrix
plot(dat[,1:3])

# Another way of making a scatterplot matrix, with regression lines
# and histogram/boxplot/density/qqplot/none along the diagonal
library(car)
scatterplotMatrix(dat[,1:3],
                  diagonal="histogram",
                  smooth=FALSE)