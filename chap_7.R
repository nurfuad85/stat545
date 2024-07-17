library(tidyverse)
library(gapminder)

## Create a copy of gapminder
my_gap <- gapminder

## store the output as an R object
my_precious <- my_gap %>% filter(country == "Canada")


## Use mutate() to add new variables
ctib <- my_gap %>%
  filter(country == "Canada")
## this is a semi-dangerous way to add this variable
## I'd prefer to join on year, but we haven't covered joins yet
my_gap <- my_gap %>%
  mutate(tmp = rep(ctib$gdpPercap, nlevels(country)),
         gdpPercapRel = gdpPercap / tmp,
         tmp = NULL)


## Use arange() to row-order data
my_gap %>%
  filter(year == 2007) %>%
  arrange(desc(lifeExp))



## rename(), filter() and select()
my_gap %>%
  filter(country == "Burundi", year > 1996) %>% 
  select(yr = year, lifeExp, gdpPercap) %>% 
  select(gdpPercap, everything())


## group_by() and summarize()
my_gap %>% 
  group_by(continent) %>% 
  summarize(n = n())

my_gap %>% 
  group_by(continent) %>% 
  summarize(n = n(),
            n_countries = n_distinct(country))


## compute the average life expectancy by continent
my_gap %>% 
  group_by(continent) %>% 
  summarize(avg_lifeExp = mean(lifeExp))


## compute average and median life expectancy and GDP per capita by continent by year
## but only for 1952 and 2007
my_gap %>%
  filter(year %in% c(1952, 2007)) %>%
  group_by(continent, year) %>%
  summarize_at(vars(lifeExp, gdpPercap), list(~mean(.), ~median(.)))