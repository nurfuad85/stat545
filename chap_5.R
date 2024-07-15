# install.packages("gapminder")
library(gapminder)

# install.packages("tidyverse")
library(tidyverse)

# attach(gapminder)
plot(lifeExp ~ year, data = gapminder)

plot(lifeExp ~ gdpPercap, gapminder)

plot(lifeExp ~ log(gdpPercap), gapminder)

summary(gapminder$lifeExp)
hist(gapminder$lifeExp)

barplot(table(gapminder$continent))

## we exploit the fact that ggplot2 was installed and loaded via the tidyverse
p <- ggplot(filter(gapminder, continent != "Oceania"),
            aes(x=gdpPercap, y=lifeExp)) #just initializes

p <- p + scale_x_log10()
p + geom_point() # scatterplot
p + geom_point(aes(color = continent)) # map continent to color
p + geom_point(alpha = (1/3), size = 3) + geom_smooth(lwd = 3, se = FALSE)
#> `geom_smooth()` using method = 'gam' and formula 'y ~ s(x, bs = "cs")'

p + geom_point(alpha = (1/3), size = 3) + facet_wrap(~ continent) +
  geom_smooth(lwd = 1.5, se = FALSE)
#> `geom_smooth()` using method = 'loess' and formula 'y ~ x'

# Use data frames!!!
# Use the tidyverse!!! This will provide a special type of data frame called a “tibble” that has nice default printing behavior, among other benefits.
# When in doubt, str() something or print something.
# Always understand the basic extent of your data frames: number of rows and columns.
# Understand what flavor the variables are.
# Use factors!!! But with intention and care.
# Do basic statistical and visual sanity checking of each variable.
# Refer to variables by name, e.g., gapminder$lifeExp, not by column number. Your code will be more robust and readable.