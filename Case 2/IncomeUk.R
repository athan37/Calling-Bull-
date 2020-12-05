# Duc Anh, DCS 105 A Calling Bull
# BS #2, Income pie chart,  Dec 12, 2020
library(readxl)
library(tidyverse)
library(scales)
#Original data from: https://www.ons.gov.uk/file?uri=/peoplepopulationandcommunity/personalandhouseholdfinances/incomeandwealth/bulletins/householddisposableincomeandinequality/financialyearending2019/2b8cc427.xlsx
#This used Trimmed data version, which are included in the same file
Income_UK_2019 <- read_excel("C:/Users/Than Duc Anh/Downloads/Income UK 2019.xlsx", 
                             sheet = "Sheet4")
#View(Income_UK_2019)
colnames(Income_UK_2019)= c("Income", "NoOfPeople", "TotalPerBand")
names(Income_UK_2019)

#Group income base on x < 27k, 27k <= x <= 58k, x > 58k
mid <- Income_UK_2019 %>% filter(Income >= 27 & Income <= 58)  
low <- Income_UK_2019 %>% filter(Income < 27)
high <- Income_UK_2019 %>% filter(Income > 58)  

#Get data for the pie chart
df <- data.frame (
  group = c("£  1000  - £ 27000 ", "£ 27000 - £ 58000", "£ 58000+"),
  value = c(sum(low["NoOfPeople"]), sum(mid["NoOfPeople"]), sum(high["NoOfPeople"]))
)


total = sum(df$value) #get total number of people 
head(df)

df %>% 
  ggplot(aes(x = "", y = value, fill = group)) + 
  #plot bar graph first
  geom_col() + 
  #x = 1.6 will bring labels out side the circle. Position helps make the circle round
  geom_text(aes(x = 1.6, label = percent(value/total)), position = position_stack(vjust = 0.5)) + 
  scale_fill_brewer(palette = "Greens") +
  #make circle
  coord_polar("y") + 
  theme_void() + 
  labs(title = "Distribution of income in UK 2019",
       fill  = "Income")
