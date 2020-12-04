library(ggplot2)
aveSalary <- c(58, 48, 36, 32, 38, 27)
lengths <- c(3, 4, 5, 6, 7, 8)
noOfResponse <- c(2, 7, 34, 46, 8, 3)
averagePromotion <- c(2.6, 2.9, 1.8, 1.2, 0.7, 0.5)

df <- data.frame(lengths, noOfResponse)

sd(noOfResponse)


df$lengths <- factor(df$lengths, levels = c(3:8))
p <- ggplot(df) 
p + geom_bar(aes(lengths, noOfResponse), stat = "identity") + 
  ggtitle("Distribution of penile length from 1000 random people") +
  ylab("Percentage of response") + 
  xlab("Penile length") 
 

