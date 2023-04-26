#Loading packages for visualization
library(tidyverse) 
library(ggplot2)
library(RColorBrewer)
library(scales)
library(lubridate)
library(ggcorrplot)
library(lattice)
library(psych)
library(reshape2)
#import data
df <- read.csv("/Users/Camer/OneDrive/Desktop/Data_Vis_final_project/london_merged.csv")
#factor the data
df$season <- factor(
  df$season, levels = c(0,1,2,3),
  labels = c('Spring', 'Summer', 'Fall','Winter'),
  ordered = TRUE)
df$weather_code <- factor(
  df$weather_code, levels = c(1,2,3,4,7,10,26),
  labels = c('Clear', 'Scattered clouds', 'Broken clouds', 'cloudy', 'Light rain','Thunderstorm', 'snowfall'),
  ordered = TRUE)
#drop NA values and rename columns
df <- na.omit(df)
df <- df %>%
  rename(bikeshares = cnt)
df <- df %>%
  rename(Temp_real = t1)
df <- df %>%
  rename(Temp_feels_like = t2)
df <- df %>%
  rename(Weather = weather_code)
df <- df %>%
  rename(Humidity = hum)
#visualizations of different data variables 
ggplot(df, aes(season, bikeshares, fill = season)) + 
  geom_bar(stat = "identity", show.legend = FALSE) + 
  labs(title = "Bikeshares and Seasons", x = "Seasons", y = "Bikeshare Rentals") +
  scale_fill_brewer(palette = "Pastel1")+
  scale_y_continuous(labels = scales::label_comma())
#Weather and Rentals
ggplot(df, aes(Weather, bikeshares, fill = Weather)) + 
  geom_bar(stat = "identity", show.legend = FALSE) + 
  labs(title = "Bikeshares and Weather", x = "Weather", y = "Bikeshare Rentals") + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  scale_fill_brewer(palette = "Spectral")+
  scale_y_continuous(labels = scales::label_comma())

#Correlation of different variables
dfcortemp1 <- cor(data.frame(df$Temp_real, df$bikeshares))
dfcortemp1
dfcortemp2 <- cor(data.frame(df$Temp_feels_like, df$bikeshares))
dfcortemp2
dfcorhum <- cor(data.frame(df$Humidity, df$bikeshares))
dfcorhum
ggplot(df, aes(Temp_real, bikeshares)) + 
  geom_point(alpha = .9, aes(color = Temp_real)) + 
  scale_color_continuous(low = "lightblue", high = "lightgreen")+
  labs(title = "bikeshare rentals and real temperature", x = "Temperature(C)", y = "bikeshare rentals")
#Correlation visualization
ggplot(df, aes(Temp_feels_like, bikeshares)) + 
  geom_point(alpha = .9, aes(color = Temp_feels_like)) + 
  scale_color_continuous(low = "lightblue", high = "lightgreen")+
  labs(title = "bikeshare rentals and feels like Temperature", x = "Temperature(C)", y = "bikeshare rentals")
