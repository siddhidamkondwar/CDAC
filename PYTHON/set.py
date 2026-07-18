s={10,20,50,30,40}
# set is unordered.

print(s)

s =  {10,20,50,30,40,40,30}
# duplicate value is not permitted.

print(s)

#s[1] = 12 # immutable data type

print(s)

# print(s[2])TypeError: 'set' object is not subscriptable 

#s = {[20,30,40,60]} #TypeError: unhashable type: 'list'

s ={(10,20,30),90}

print(s)

s.add(25)


print(s)

s.update([29,30])
print(s)

s.remove(29)

print(s)

s.discard(30)
print(s)

s.pop()
print(s)
