# Plotting Biketown trip data with base R
install.packages("tidyverse")
library(tidyverse)
library(lubridate)

biketown <- read.csv("data/biketown-2018-trips.csv")
str(biketown)

summary(biketown)

## tidyverse
biketown$hour <- 
  hms(biketown$StartTime) %>%
  hour()

biketown$month <- 
  mdy(biketown$StartDate) %>%
  month(label = T, abbr = T)

str(biketown$month)
## same as this in base
stime <- hms(biketown$StartTime)
biketown$hour <- hour(stime)

freq_by_hour <- table(biketown$hour)
barplot(freq_by_hour)

# investigate hourly bins
hist(biketown$hour, breaks = seq(0, 24, 3))

# focus on the AM peak
am_peak <- subset(biketown, hour >= 7 & hour < 10)
hist(am_peak$hour, breaks = seq(7, 10, 1)) # not great!
barplot(table(am_peak$hour))

# looking into seasonal patterns
freq_by_month <- table(biketown$month)
barplot(freq_by_month)

# looking at stations

freq_by_station <- table(biketown$StartHub)
barplot(freq_by_station)

# top 25 stations
s <- sort(freq_by_station, decreasing = T)[1:25]
dotchart(s)

