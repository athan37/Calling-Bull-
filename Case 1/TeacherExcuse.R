# Duc Anh, DCS 105 A Calling Bull
# BS #1, Activities per day pie chart,  Dec 12, 2020
library(ggplot2)
library(dplyr)
library(scales)

#Make data for the pie chart
df <- data.frame (
  group = c("Sleep", "Eat", "Sport", "Talking", "Other"),
  value = c(8, 2, 1, 1, 12)
)

#Get total hour per day
total = sum(df$value)

head(df)

df %>% 
  ggplot(aes(x = "", y = value, fill = group)) + 
  #Build bar chart first
  geom_col() + 
  #x = 1.6 will bring labels out side the circle. Position helps make the circle round
  geom_text(aes(x = 1.6, label = percent(value/total)), position = position_stack(vjust = 0.5)) + 
  scale_fill_brewer(palette = "Reds") +
  #Make circle
  coord_polar("y") + 
  theme_void() + 
  labs(title = "Percentage of activities per day according to the story",
       fill  = "Activity")
