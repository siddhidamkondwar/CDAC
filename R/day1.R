# basic mathematical operations
# addition, subtraction, multiplication, division
6 + 7   # addition
15 - 8  # subtraction
3 * 6   # multiplication
45 / 9  # division
4^3     #exponential
4**3    #exponential


# level of priority for multiple operations

# 1. brackets
# 2. exponential
# 3. division
# 4. multiplication
# 5. addition and subtraction
5+3*4
5+3**2*4
(5+3)**2*4

45 %% 4   #  gives the remainder when 45 is divided by 4
45 %/% 4   #  gives the modulus when 45 is divided by 4

#str() is a command to find the type of variable 
x1=10
str(x1)

#to store integer value Write uppercase 'L' succeeding to the number 
x2=13L
str(x2)
item1 = 'sudeep\'s laptop

#\overwrite the " or coming within the string 
#logical values we must be write in upper case i.e TRUE FALSE 

k1=TRUE 
str(k1)
k2=F
str(k2)

#lowecase c used for creating vector (its like list in python) means concatinate

s1=c(10,20,30,40)
str(s1)

s2=c('siddhi','sneha','shreyas')
str(s2)


 k2 = c('Sudeep','Ruchika','Arjun')

#lenght command is used to extract the values from vector
#adding values to vector 
#Method-A
K1=append(k1,5)

k1 = c(4,8,7,3,2)
k2 = c(5,8,6)
k1 = append(k1,k2,4)
k1
length(k1)
k1[3]=6
k1


#- used to remove elements from vector 
k1[-4] #temprory remove 4th element from vector 
k1=k1[-4]#modify the k1 with removing -4th element 



#fror extracting multiple values use cammmand 
k1[c(3,6,8)]

#for changing values of vector (modifying )

k1[c(2,5,7)]=c(4,15,5)



#vector calculaton 
sum(k1)    # adds all values of vector k1
prod(k1)   # gives the product of all values of k1
min(k1)    # minimum value in the vector k1
max(k1)    # maximum value in the vector k1


cumsum(k1)[3]  #cumulative sum upto each index
k1

cummin(k1)     #lowest value of the vector k1 uptop the perticular index 

cummax(k1)     #higest value of the vector k1 uptop the perticular index 



#RECYCLING OF VECTORS 

x1=c(5,3,2,7)
x2=c(1,2,3,4)
x3=c(6,8)
x4=c(4,7,3)
#case 1 : Operating a verctor with a scalar quantity
x1+5
x1-5

#case 2 : Operating a verctor of same length
x1+x2
x1*x2


#case 3 : Operating a verctor of diff length but lenght of longer vector ia an exact multiple of length of smaller vector 

x1+x3


#case 4 : Operating a verctor of diff length but length of the longer verctor is NOT an exact multiple of length of smaller vector
x1
x4
x1+x4

#smaller vector RECYCLE ITSELF 
1.recyle is always happens beacuse of 2 vectors are of diff length 
2.smaller vector is recycle iytself 

s1=c(10,20,30,40)
s2=c(50,60,70,80)
s3=c(90,10,20)
s4=c(40)

s1+s3
s2+s1
s2
s1
s2*s1
s2
s1
s2/s1

smaller vector will keep recyle itself 




