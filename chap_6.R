## Chapter 6 - Introduction to dplyr

library(tidyverse)
library(gapminder)

as_tibble(iris)

filter(gapminder, lifeExp < 29)
filter(gapminder, country %in% c("Rwanda", "Afghanistan")) %>% print(n=25)

gapminder[gapminder$lifeExp < 29, ] ## repeat `gapminder`, [i, j] indexing is distracting
subset(gapminder, country == "Rwanda") ## almost same as filter; quite nice actually

gapminder %>% head()

head(gapminder, 3)

select(gapminder, year, lifeExp)

gapminder %>%
  select(year, lifeExp) %>%
  head(4)

gapminder %>%
  filter(country == "Cambodia") %>%
  select(year, lifeExp)

# Vs typical base R like this:
gapminder[gapminder$country == "Cambodia", c("year", "lifeExp")]


