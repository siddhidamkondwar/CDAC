getwd()
"D:\R programming"
setwd("D:/R programming")
getwd()
library(readxl)
df=read_excel('ERPData.xlsx',sheet='Info')
head(df,4) #gives first 4 entries of matrix
tail(df)   #gives last 6 entries of matrix
nrow(df)   #gives first 6 entries of matrix
ncol(df)  #gives no of column 
str(df)
length(unique(df$MaterialID))
unique(df$MaterialID)




max(df$Quantity)
df$Quantity
which(df$Quantity==27)
df[c(3,31),]
which(df$Quantity==max(df$Quantity))
df[25,]
df[25,c(1,2),]


length(which(df$Location=='MWH-3'))


length(which(df$MaterialID=='AXCP-78')&(df$Location=='MWH-2'))

new_df=df[which(df$Location=="MWH-2"),]
new_df
new_df=df[which(df$Location=="MWH-2"),]
new_df


mydf2 = df[which(df$Location=='MWH-2' & df$MaterialID=='GCVB-79'),]
mydf2

nrow(df[which(df$Location=='MWH-2' & df$MaterialID=='GCVB-79'),])

sum(mydf2[,3])

   
rade=c()
for (i in df$Quantity){
  g=ifelse(i<=50,'A','B')
  grade=append(grade,g)
}
df$grade=grade   
df   





#In the mtcars dataset, create a new column with the name Eff. The values in this column should be calculated by dividing the value of mpg with the wt
#Divide these values of Eff into three categories. Identify the Grade of each car from these categorise
#Min Eff = 5, Max Eff = 20
#Three categories could be 5-10, 10-15, 15-20
#If the Eff value is 5-10 then Grade=A,
#If the Eff value is 10-15 then Grade=B
#If the Eff value is 15-20 then Grade=C
