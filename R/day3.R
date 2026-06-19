#Database management 
#Data cleaning
#identify the missing values
#idetify duplicate values
#Data validation 
#NA
#<NA>


x1=c(4,7,6,3,8)
length(x1)
x1[6] = 9
x1

x1[3]=9
length(x1)


getwd()
"D:\R programming"
setwd("D:/R programming")
getwd()

library(readxl)

df = read_excel('CDAC_DataBook.xlsx', sheet='EmpInfo')
df
which(is.na(df$Deptt))#gives the row no where the department is na

which(is.na(df$Deptt)&is.na(df$EmpID))

which(complete.cases(df))

which(!complete.cases(df))	# gives the row numbers where there is atleast ONE missing value


which(duplicated(df$Passport))

t1 = unique(df$Passport)
t1
d1 = which(duplicated(df$Passport))
d1
p1 = unique(df$Passport[d1])
p1
which(df$Passport %in% p1)




d1 = which(duplicated(df$Passport))   # row numbers where the passport number is appearing for second or subsequent time
p1 = unique(df$Passport[d1])	# passport numbers which are occurring atleast two times
which(df$Passport %in% p1)     # row numbers where the passport number has multiple occurrences INCLUDING the first occurrence







x1=c(5,7,4,6,8,2)
x2=c(4,7,2,9)

x1 %in% x2

which(x1 %in% x2)

head(airquality)
length(which(is.na(airquality$Ozone) | is.na(airquality$Ozone)))
length(which(is.na(airquality$Ozone) | is.na(airquality$Solar.R)))

length(which(airquality$Temp>=65 & airquality$Temp<=85))
nrow(airquality)
df1 = subset(airquality,airquality$Temp>=65 & airquality$Temp<=85)
df1
df2 = subset(airquality,airquality$Temp<65 | airquality$Temp>85)
df2

LETTERS
letters




x1=c(5,7,4,6,8,2)
sort(x1)

sort(x1, decreasing = T)




x1 = c(4,6,9,2,5,8,1,3)
sort(x1)   # sorts the vector in the ascending order

sort(x1, decreasing = T)   # sorts the vector in the descending order

order(x1)  #gives index of before sorting  

x1[7]


getwd()
"D:\R programming"
setwd("D:/R programming")
getwd()

library(readxl)
df = read_excel('CDAC_DataBook.xlsx', sheet = 'ERPData')
head(df)
min(df$Quantity)
max(df$Quantity)
df1 = df[order(df$Quantity),]
head(df1)


df1 = df[order(df$Quantity),]
df1 = df[order(df$Quantity),]    # reshuffles the df as df1 where the lowest quantity goes at the top, highest at the bottom
df2 = df[order(df$Quantity, decreasing = T),]   # reshuffles the df as df2 where the highest quantity goes at the top, lowest at the bottom





df1 = df[order(df$MaterialID,df$Location,df$Quantity),]
df(df1,15)



f1 = df[order(df$MaterialID),]
df1 = df[order(df$MaterialID),]
df1 = df[order(df$MaterialID,df$Location),]
df1 = df[order(df$MaterialID,df$Location,df$Quantity),]





ind2 = order(-xtfrm(df$MaterialID),df$Location,-df$Quantity)
df3=df[ind2,]
head(df3,20)






#merging of data frames 
df1 = read_excel('CDAC_DataBook.xlsx', sheet='Pune')
df2 = read_excel('CDAC_DataBook.xlsx', sheet='Mumbai')
df1
getwd()
"D:\R programming"
setwd("D:/R programming")
getwd()

df2

merge(df1,df2)

merge(df1,df2, by='Name')




merge(df1,df2, by=c('Name','Subject'))

merge(df1,df2,all=T)
merge(df1,df2,by='Name',all.x=T)



# Merging of dataframes

df1 = read_excel('CDAC_DataBook.xlsx', sheet='Pune')
df2 = read_excel('CDAC_DataBook.xlsx', sheet='Mumbai')

merge(df1,df2)   # gives an empty dataframe because there is no combination of Name+Subject+Grade common to BOTH df1 and df2
merge(df1,df2,by="Name")   # gives two rows because Vaibhav and Vinod names are there in both df1 and df2. Subject.x and Grade.x mentions the value of Vaibhav or Vinod in df1 and Subject.y and Grade.y mentions the value of Vaibhav or Vinod in df2

#In above two commands, all=F (by default) which stands for intersection. all=T stands for union.

merge(df1,df2,by='Name',all=T)
# In above command we get 10 rows. 4 names each from df1 and df2 which are unique and 2 names which are common to both df1 and df2. 

merge(df1,df2,by='Name',all.x=T)
# In above command we perform the left join. Since df1 gets the preference, we will not have any NA under subject.x and grade.x. If the Name is common to both df1 and df2 then we will have values under subject.y and grade.y also


merge(df1,df2,by='Name',all.y=T)
# In above command we perform the right join. Since df2 gets the preference, we will not have any NA under subject.y and grade.y. If the Name is common to both df1 and df2 then we will have values under subject.x and grade.x also


#install.packages('dplyr')
#> install.packages('tidyr')
#> library(dplyr)
#>  library(tidyr)




mean(mtcars$wt)
head(mtcars)
mean(mtcars$mpg)
summarise(mtcars,Mean_mpg=mean(mpg),Mean_wt=mean(wt),Max_drat=max(drat))

t1=summarise(mtcars,Mean_mpg=mean(mpg),Mean_wt=mean(wt),Max_drat=max(drat))
t1

str(t1)
unique(mtcars$gear)
summarise(group_by(mtcars,gear),Mean_mpg=mean(mpg),Mean_wt=mean(wt),Max_drat=max(drat))

summarise(group_by(mtcars,gear),Mean_mpg=mean(mpg),Mean_wt=mean(wt),,Nums=n())


nrow(mtcars)
head(mtcars)
filter(mtcars,mpg>=20)
filter(mtcars,mpg>=20, gear==4)
sample_frac(mtcars,0.1)
sample_n(mtcars,5)

select(mtcars, mpg, wt)





library(dplyr)

head(mtcars)

arrange(mtcars, mpg)        # ascending order
arrange(mtcars, desc(mpg))  # descending order

select(mtcars, mpg, wt)
select(mtcars, -mpg,-wt)
df1$Eff = round(df1$Eff,2)
df1 = mutate(mtcars,Eff=mpg/wt)


setwd("D:/R programming")
getwd()
df=read_excel('CDAC_databook.xlsx',sheet='Health')
df




df1 = gather(df,Year,Cases,c('2019','2020','2021'))
df1 = gather(df,Year,Cases,c('2019','2020','2021'))




df2 = spread(df1,Disease,Cases)
#In the dataframe df2, The unique values of Disease column of df1 will become a separate column. The values under the new columns will be taken from the Cases column.v










































