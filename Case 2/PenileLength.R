library(ggplot2)
#import data
aveSalary <- c(58, 48, 36, 32, 38, 27)
lengths <- c(3, 4, 5, 6, 7, 8)
noOfResponse <- c(2, 7, 34, 46, 8, 3)
averagePromotion <- c(2.6, 2.9, 1.8, 1.2, 0.7, 0.5)

#make a data frame to use ggplot2
df <- data.frame(lengths, noOfResponse)

#label scale for x axis
df$lengths <- factor(df$lengths, levels = c(3:8))


p <- ggplot(df) 

#Create color bar
p + geom_col(aes(lengths, noOfResponse, fill = noOfResponse)) +
  #https://uigradients.com/#BackToEarth
  scale_fill_gradient2(name = "% Response", high="#00C9FF", low = "#92FE9D") + 
  ggtitle("Distribution of penile length from 1000 random people") +
  ylab("Percentage of response(%)") + 
  xlab("(Erect) penile length(inches)") +
  theme(
    plot.background = element_rect(fill = "white"),
    panel.background = element_rect(fill = "white"),
    axis.line = element_line(color = "#00C9FF"),
    axis.text = element_text(color = "black"),
    plot.title = element_text(color = "#00C9FF")
  ) +
  #Make the bar starts at 0
  scale_y_continuous(expand = c(0, 0), limits = c(0, NA)) 

 
