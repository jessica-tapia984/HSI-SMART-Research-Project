library(ggplot2)

mydata <- read.csv("C:\\Users\\acer\\Documents\\Pmetrics\\src\\sourcedata.csv")
#concentration over 24 hours, colored by Id
ggplot(mydata, main="Title", aes(x=TIME, y=Concentration, group =ID)) +
  geom_point(size=1)+
  geom_line(color=factor(mydata$ID))+
  xlab("Time(hr)")


#relation between AGE and BMI
ggplot(mydata, aes(x=AGE, y=BMI)) +
  geom_point()

#relation between BMI and dose
ggplot(mydata, aes(x=DOSE, y=BMI)) +
  geom_point()

#relation between BMI and WT
ggplot(mydata, aes(x=BMI, y=WT)) +
  geom_point()+ ylab('Weight')




#create table finding max, min, median, range, and standard deviation of dose, age, BMI, and weight
tab <- matrix(c(max(mydata$DOSE), min(mydata$DOSE), median(mydata$DOSE), diff(range(mydata$DOSE)), sd(mydata$DOSE),
                max(mydata$AGE), min(mydata$AGE), median(mydata$AGE), diff(range(mydata$AGE)), sd(mydata$AGE),
                max(mydata$BMI), min(mydata$BMI), median(mydata$BMI), diff(range(mydata$BMI)), sd(mydata$BMI),
                max(mydata$WT), min(mydata$WT), median(mydata$WT), diff(range(mydata$WT)), sd(mydata$WT)), ncol = 5)
colnames(tab)<- c('Maxiumum', 'Minimum', 'Median', 'Range', 'Standard Deviation')
rownames(tab)<- c('Dose', 'Age', 'BMI', 'Weight')
  
mytable <- as.table(tab)
print(mytable)

