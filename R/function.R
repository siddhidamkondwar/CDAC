#take 2 numbers AS a input
#multiply the first number woth 2 anf add the seconf number to it
Myfun= function (a,b){
  x1=2*a+b
  print(x1)
  
}


user_name=readline('please enter your name : ')

user_age=as.numeric(readline('please enter your age : '))

CalTax=function(salary){
  tax=salary*0.1
  print(tax)
}

CalcTax=function(sal,rate=0.1){
  tax=sal*rate
  print(tax)
}

#function takes 3 inputs a,b,c 
Myfunc=function (a ,b=3,c=7){
  d=a+b*c
  print(d)
}
#we can use default value as well as user de4fined values both are acceptable



#if-else
CalcTax=function(salary){
  if (salary<=20000){
    tax=0
  }else{
    tax=salary*0.1
  }
  print(tax)
}
CalcTax(35000)






CalcTax=function(sal){
  if(sal<=20000){
    tax=0
  }else{
    if(sal<=50000){
      tax=0.1*sal
      }else{
        tax=0.15*sal
      }
    }
  print(tax)
}


sal = as.numeric(readline('Enter salary '))
grade = ifelse(sal<=50000,'A','B')
print(grade)

# if sal<=50000 grade=>A
# if sal>50000  and <=100000 grade=>B
# if sal > 100000 grade=> C

grade = ifelse(sal<=50000,'A',ifelse(sal<=100000,'B','c'))
print(grade)



# client is a government company - tax = 5%
# client is a private company - tax = 15%
# client is an individual - tax = 10%

client = readline('Enter the type of client ')
taxrate = switch(client, govt=5, pvt=15, individual=10, 20)
print(taxrate)



#for loop is used  when the number of iterations is known

#while loop is use when number of iterations are not known but the loop continues till a particular condition remains true

for(ctr in 2:10){
  print(ctr**2)
}
myvect=c()
for (ctr in 1:3){
  n=as.numeric(readline('ENTER THE NUMBER'))
  myvect=append(myvect,n)
  
}
print(myvect)

#while loop
# condition for the while should be ensured to be true
# the variable used for the entry condition should get changed inside the loop

my_vect = c()
n1 = 7
while(n1 != 0) {
  n1 = as.numeric(readline('Enter the value '))
  my_vect = append(my_vect,n1)
}
print(my_vect)




my_vect = c()
r = 'Y'
while(r != 'N') {
  n1 = as.numeric(readline('Enter the value '))
  my_vect = append(my_vect,n1)
  r = readline('Do you want to continue Y/N ')
}
print(my_vect)















