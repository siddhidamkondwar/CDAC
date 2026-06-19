
mat1 = matrix(1:12, nrow=3)
mat1
rownames(mat1) = c('Anjali','Akash','Abhinav')
mat1
 colnames(mat1) = c('R','AAS','PML','AI')
 mat1
 mat1 = rbind(mat1,r1)
 mat1
 rownames(mat1)[4] = 'Abhishek'
 mat1
 CV =  c(6,9,5,4)
 mat1 = cbind(mat1,CV)
 
 
#2 columns of string 1st name and  location 1 column of numbers -marks
 
 #method 1
 
 std_df=data.frame(n1,locn,m1)
 stu_df
 
 
 #method 2
 
n1 = c('Gayatri','Shikha','Rahul','Chetan')
locn = c('MUM','DLI','BLR','CHN')
m1 = c(68,76,59,92)
stu_df=data.frame(Name=n1,Location=locn,Marks=m1)
stu_df
 
new_df = data.frame(n1=c('Sudeep','Rakesh'),k1 = c('BLR','LKO'), m1= c(80,90))
colnames(new_df) = colnames(stu_df)
stu_df = rbind(stu_df,new_df) #binding of two matrix with same name 
stu_df


#we can add vrector in between a matrix 
#the command is  

stu_df=rbind(stu_df[1:3,],new_df,stu_df[4:6,])
stu_df



marks_AAS = c(70,80,60,55,75,82,91,85)

stu_df = cbind(stu_df,marks_AAS)
stu_df
colnames(stu_df)[3] = Marks_PML
stu_df

stu_df$Location


stu_df$Marks_PML
Marks_AI = c(60,70,50,92,64,58,67,91)
stu_df$Marks_AI = Marks_AI
stu_df




#negative indexing delete the matrix row and column
stu_df[-c(2,4)]


stu_df























































