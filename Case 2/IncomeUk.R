library(readxl)
library(tidyverse)
library(scales)
Income_UK_2019 <- read_excel("C:/Users/Than Duc Anh/Downloads/Income UK 2019.xlsx", 
                             sheet = "Sheet4")
#View(Income_UK_2019)
colnames(Income_UK_2019)= c("Income", "NoOfPeople", "TotalPerBand")
names(Income_UK_2019)
Income_UK_2019
mid <- Income_UK_2019 %>% filter(Income >= 27 & Income <= 58)  
low <- Income_UK_2019 %>% filter(Income < 27)
high <- Income_UK_2019 %>% filter(Income > 58)  


df <- data.frame (
  group = c("£  1000  - £ 27000 ", "£ 27000 - £ 58000", "£ 58000+"),
  value = c(sum(low["NoOfPeople"]), sum(mid["NoOfPeople"]), sum(high["NoOfPeople"]))
)


total = sum(df$value)

head(df)

df %>% 
  ggplot(aes(x = "", y = value, fill = group)) + 
  geom_col() + 
  #x = 1.6 will bring labels out side the circle. Position helps make the circle round
  geom_text(aes(x = 1.6, label = percent(value/total)), position = position_stack(vjust = 0.5)) + 
  scale_fill_brewer(palette = "Greens") +
  coord_polar("y") + 
  theme_void() + 
  labs(title = "Distribution of income in UK 2019",
       fill  = "Income")
