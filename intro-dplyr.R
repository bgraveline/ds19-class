# Intro to dyplyr
library(dplyr)

# load gapminder data as sample dataset

gapminder <- read.csv("data/gapminder_data.csv", stringsAsFactors = F)

mean(gapminder[gapminder$continent == "Africa", "gdpPercap"])

# This is a pipe: %>%
# Functions we will learn today from dplyr:
# 1. select()
# 2. filter()
# 3. group_by()
# 4. summarize()
# 5. mutate()

# what attributes are in gapminder:

colnames(gapminder)

# select three attributes from gapminder:
subset1 <- gapminder %>% 
  select(country, continent, lifeExp)

# select every attribute except 2
subset2 <- gapminder %>%
  select(-lifeExp, -pop)

#select some attributes but rename a few of them for clarity
subset3 <- gapminder %>%
  select(country, population = pop, lifeExp, gdp = gdpPercap)
str(subset3)

# using filter()
africa <- gapminder %>%
  filter(continent == "Africa") %>%
  select(country, population = pop, lifeExp)
table(africa$country)

# select year, population, country, for Europe

europe <- gapminder %>%
  filter(continent == "Europe") %>%
  select(year, pop, country)
View(europe)
