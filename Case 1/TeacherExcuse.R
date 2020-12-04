
library(ggplot2)
library(dplyr)
library(scales)

df <- data.frame (
  group = c("Sleep", "Eat", "Sport", "Talking", "Other"),
  value = c(8, 2, 1, 1, 12)
)

total = sum(df$value)

head(df)

df %>% 
  ggplot(aes(x = "", y = value, fill = group)) + 
  geom_col() + 
  #x = 1.6 will bring labels out side the circle. Position helps make the circle round
  geom_text(aes(x = 1.6, label = percent(value/total)), position = position_stack(vjust = 0.5)) + 
  scale_fill_brewer(palette = "Reds") +
  coord_polar("y") + 
  theme_void() + 
  labs(title = "Activities per day according to the story",
       fill  = "Activity")
