#Module 4 code 
Freq <- c(0.6,0.3,0.4,0.4,0.2,0.6,.3,0.4,0.9,0.2) 
BP <- c(103,87,32,43,59,109,78,205,135,178) 
First <- c(1,1,1,1,0,0,0,0,NA,1) #Data updated with 1 as bad and 0 as good 
Second <- c(0,0,1,1,0,0,1,1,1,1) #Data updated with 0 as low and 1 as high
Final <- c(0,1,0,1,0,1,0,1,1,1) #Data updated with 0 as low and 1 as high
hospital.df <- data.frame(Freq,BP,First,Second,Final)
hospital.df2 <- na.omit(hospital.df)
hospital.df2$Mean_Decision <- rowMeans(hospital.df2[,c('First', 'Second')], na.rm=TRUE)
boxplot(hospital.df2$BP, hospital.df2$Mean_Decision)
hist(hospital.df2$BP)
hist(hospital.df2$Mean_Decision)
