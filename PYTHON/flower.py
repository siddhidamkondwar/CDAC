flowers = {
 "Rose": {"price": 50, "quantity": 20, "category": "Decorative"},
 "Lily": {"price": 80, "quantity": 15, "category": "Seasonal"},
 "Tulip":{"price":100,"quantity": 10,"category": "Seasonal"}
}


def add_flower():
    name = input("enter the name of flower :")
    price = int(input("enter the price of the flower :"))
    quantity = int(input("enter the quantity of the flower :"))
    category = input("enter the catagory of the flower :")
    flowers.update({ name :{
        "price" : price,
        "quantity":quantity,
        "category":category
    }
    } )



#Addflower()

#print(flowers)

def update_flower():
    name = input("enter the name of flower :")
    if name in flowers:
        price = int(input(f"Enter the new price for {name} : "))
        quantity = int(input(f"Enter the new quantity for {name} : "))
        #category = input(f"enter the new Category for {name} : ")
        flowers[name]['price']=price
        flowers[name]['quantity']=quantity
        #flowers[name]['category']=category
        
        print("Details updated succesfully!!")
    else:
        print("Record not found!!")

#update_flower()

def search_flower():
    name = input("enter the name of flower :")
    if name in flowers:
        print(flowers[name])
    else:
        print("Record not found!!")

# search_flower()

def delete_flower():
    name = input("enter the name of flower :")
    if name in flowers:
        del flowers[name]
        print(f"{name} deleted succesfully!!")
    else:
        print("Record not found!!")

#delete_flower()

def display_flower():
    for name in flowers:
        print(name,":","Price :",flowers[name]['price'],"| Quantity :",flowers[name]['quantity'],"| Category :",flowers[name]['category'])

#display_flower()  


def display_flowername():
    print("Flowers : ")
    n=1;
    for name in flowers:
        print(n,":",name)
        n+=1


#display_flowername()

def dispaly_details():
    print("Price | Quantity")
    for name in flowers:
        print(flowers[name]['price'],"  |",flowers[name]['quantity'])

#dispaly_details()


def is_flower():
    name = input("enter the name of flower :")
    if name in flowers:
        print(name,"is in the record!")
    else:
        print(name,"is not in the record!")

#is_flower()

def count_flower():
    count = len(flowers)
    print("Total records availabe is ",count)

#count_flower()


def max_price():
    max_price=0
    for name in flowers:
        price = flowers[name]['price']
        if max_price<price:
            max_price= price
            flower = name

    print("Expensive flower :",flower)

#max_price()
        

def min_price():
    min_price=float('inf')
    for name in flowers:
        price = flowers[name]['price']
        if min_price>price:
            min_price= price
            flower = name

    print("Cheapest flower :",flower)

#min_price()

def total_value():
    total = 0
    for name in flowers:
        total += flowers[name]['quantity'] * flowers[name]['price']
    print(total)


#total_value()


def low_stock():
    stck = int(input("enter the threshold :")) 
    for name in flowers:
        if flowers[name]['quantity']<=stck:
            print(name)

#low_stock()


def sort_by_name():
    sortbyname = dict(sorted(flowers.items()))
    for name in sortbyname:
        print(name,":","Price :",flowers[name]['price'],"| Quantity :",flowers[name]['quantity'],"| Category :",flowers[name]['category'])

    

#sort_by_name()

def sort_by_price():
    sortbyprice = sorted(flowers.items(),key=lambda item:item[1]["price"])
    print(sortbyprice)

#sort_by_price()


def sell_flowers():
    name = input("enter the name of flower : ")
    if name in flowers:
        if flowers[name]['quantity']>0:
            quantity = int(input("input enter the quantity:"))
            flowers[name]['quantity'] -=quantity
            #display_flower()
        else:
            print("insufficiant stock")
    else:
        print("no record")

#sell_flowers()

def restock_flowers():
    name = input("enter the name of flower : ")
    if name in flowers:
        quantity = int(input("input enter the quantity:"))
        flowers[name]['quantity'] +=quantity
        display_flower()
    else:
        print("no record")

#restock_flowers()

def Expensive_flowers():
    stck = int(input("enter the price threshold :")) 
    result = {k:v for k ,v in flowers.items() if v['price']>stck}
    # for name in flowers:
    #     if flowers[name]['price']<=stck:
    print(result)
#Expensive_flowers()


def clear_flowers():
    flowers.clear()
    print("all data cleared")
            

print("========= Flower Shop Management =========")
print("1. Add Flower")
print("3. Delete Flower")
print("4. Search Flower")
print("2. Update Flower")
print("5. Display All Flowers")
print("6. Display Flower Names")
print("7. Display Flower Details")
print("8. Check Flower Availability")
print("9. Count Total Flower Types")
print("10. Find Most Expensive Flower")
print("11. Find Cheapest Flower")
print("12. Calculate Total Stock Value")
print("13. Display Low Stock Flowers")
print("14. Sort Flowers by Name")
print("15. Sort Flowers by Price")
print("16. Sell Flower")
print("17. Restock Flower")
print("18. Show Expensive Flowers")
print("19. Clear All Records")
print("20. Exit")


flag = True
while(flag):
    choice = int(input("enter your choice:"))
    
    match choice:

        case 1:
            add_flower()
        case 2:
            update_flower()
        case 3:
            delete_flower()
        case 4:
            search_flower()
        case 5:
            display_flower()
        case 6:
            display_flowername()
        case 7:
            dispaly_details()
        case 8:
            is_flower()
        case 9:
            count_flower()
        case 10:
            max_price()
        case 11:
            min_price()
        case 12:
            total_value()
        case 13:
            low_stock()
        case 14:
            sort_by_name()
        case 15:
            sort_by_price()
        case 16:
            sell_flowers()
        case 17:
            restock_flowers()
        case 18:
            Expensive_flowers()
        case 19:    
            clear_flowers()
        case 20:
            flag = False
        case _:
            print("enter valid choice")