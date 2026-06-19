#creating the special vector
x1=40:70 #start with 40 upto 70
x1

t1=c(5,2,7,45,5,5,4,6,7,8,8,87,6,4432,1,9,3)
t1[c(4,5,6,7)]


#seq commands - when we wish to create vectors with equal gaps between two values
x1=seq(4,14)
x1

x1=seq(4,24,2)
x1

x1=seq(40,8,-3)
x1

x1=seq(4,46,length.out=13)
x1


#rep command -used when a particular pattern has to be repeated in a vector 
x1=rep(c(3,4,7),times = 4)
x1

x1=rep(c(3,4,7),each  = 4)
x1

x1=rep(c(3,4,7),times = c(4,2,5))
x1

#base of log (by defalut) is taken as e 
#e=2.7182
log(45)
exp(3.806662)

log(45,2)
2^5.491853



#Logical operations 
p1=T
p2=T
p3=F
p4=F
str(p3)

#AND Operation
p1&p2 #TRUE
p1&p3  #FALSE

#OR Operation
p1|p3 #TRUE
p4|p3 #FALSE

#NOT Operation
p1
!p1
#==comparision operato

#which command
x1 = c(7,6,4,8,3,5,2,6,9,3,2,7)
length(x1)

#need re-submission of the marks < 4
# Q1 : where are the values OR what are the indices of the values where they are < 4
# Q2 : How many values in vector are < 4
# Q3 : What are the values which < 4

k1=8
x1<4
#which tell you where the value in vector is true
which(x1<4)

length(which(x1<4))

x1[which(x1<4)]



x1 = c('Bangalore','Pune','Navi Mumbai','Nagpur','Hyderabad','Raipur')
length(x1)


nchar(x1)#number of charachters(including space)in each value
grep('pur',x1,value=T)

substr(x1,2,7)

gsub('pur','pore',x1)




r1 = 'Sudeep Bhargava'
nchar(r1)
r1_parts = strsplit(r1," ")[[1]]
r1_parts
length(r1_parts)
nchar(r1_parts)

r1_chrs = strsplit(r1,"")[[1]]
r1_chrs
length(r1_chrs)


a1 = c('A','B','C')
a2 = c(1,2,3)

a3=paste(a1,a2)
length(a3)

nchar(a3)
 paste(a1,a2, sep="")
 paste(a1,a2, sep="-")
 
 a3 = paste(a1,a2, sep="-", collapse = "***")
 a3
 
 
 
 
 
 
 