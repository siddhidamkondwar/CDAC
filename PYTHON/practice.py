#create dictionary with 4 values name and marks.

dict ={"ravi ":80,"sneha":90,"raj":60,"amit":85}

m = dict.get("raj")

print(dict)

dict.update({"prathik":95})

print(dict)

print(dict["raj"])

dict.pop("ravi ")

print(dict)

for k in dict:
    print(k)


for k in dict.values():
    print(k)

name = "amit"

if name in dict:
    print("marks = ",dict[name])
else:
    print("not found")


highest = max(dict,key=dict.get)
print("highest marks =",highest)
print("marks =",dict[highest])

print("Total count =",len(dict))


lowest = min(dict,key=dict.get)
print("lowest marks =",lowest)
print("marks =",dict[lowest])


print("average = ",sum(dict.values())/len(dict))

print(dict)

for name,marks in dict.items():
    if marks >80:
        print(name) 