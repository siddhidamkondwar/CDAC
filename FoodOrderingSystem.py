class NegativeNumberException(Exception):
    pass

class InvalidOrderException(Exception):
    pass

from abc import ABC,abstractmethod
class FoodItem(ABC):
    def __init__(self,item_id,name,price):
        self.__item_id = item_id
        self.__name=name
        self.__price = price

    def get_name(self):
        return self.__name
    def set_name(self,name):
        self.__name=name
    def get_item_id(self):
        return self.__item_id
    def get_price(self):
        return self.__price
    def set_item_id(self,item_id):
        self.__item_id=item_id
    def set_price(self,price):
        self.__price=price

    @abstractmethod
    def calculate_total(self):
        pass
class VegItem(FoodItem):
    def calculate_total(self,quantity):
        return self.get_price()*quantity
    def place_order(self):
        try:
            quantity=int(input("enter the quantity:"))
            if quantity <1:
                raise NegativeNumberException("Negative & 0 value cannot be accepted!!")
            total = self.calculate_total(quantity)
            print("Total Amount = ",total)
            select = int(input("confirm your order : \n1.confirm \n2.cancel "))
            if select==1:
                print("Order Placed Succesfully !!")
            else:
                print("cancelling the order!!")
        except ValueError:
            raise InvalidOrderException("Enter Numerical values")
        except NegativeNumberException as e:
            print(e)
        

       
    
class NonVegItem(FoodItem):
    def calculate_total(self,quantity):
        return self.get_price()*quantity+(0.1*self.get_price())
    def place_order(self):
        try:
            quantity=int(input("enter the quantity:"))
            if quantity <1:
                raise NegativeNumberException("Negative & 0 value cannot be accepted!!")
            total = self.calculate_total(quantity)
            print("Total Amount = ",total)
            select = int(input("confirm your order : \n1.confirm \n2.cancel "))
            if select==1:
                print("Order Placed Succesfully !!")
            else:
                print("cancelling the order!!")
        except ValueError:
            raise InvalidOrderException("Enter Numerical values")
        except NegativeNumberException as e:
            print(e)
    
    



# def place_order(quantity):



#FOOD ORDERING SYSTEM.

v1=VegItem(112,"Masala Dosa",120)
v2=VegItem(124,"Idly-Sambar",80)

veg = [v1,v2]

n1=NonVegItem(220,"Chicken-Biriyani",140)
n2=NonVegItem(230,"Chilli-Chicken",180)

nonveg = [n1,n2]




def order_veg():
    print("Veg Items :")
    for v in veg:
        print(v.get_item_id()," ",v.get_name())
    try:
        id = int(input("Enter the id:"))
        for v in veg:
            if id ==v.get_item_id():
                v.place_order()
                break
    except ValueError:
        print("Numerical Values Please")
    except InvalidOrderException as e:
        print(e)
        
    


def order_nonveg():
    print("Non-Veg Items :")
    for n in nonveg:
        print(n.get_item_id()," ",n.get_name())
    try:
        id = int(input("Enter the id:"))
        for n in nonveg:
            if id ==n.get_item_id():
                n.place_order()
                break
    except ValueError:
        print("Numerical Values Please")
    except InvalidOrderException as e:
        print(e)

while(True):
    print("===============#FOOD ORDERING SYSTEM#================ ")

    print("Items Available for ordering :")
    print("1.Veg Item")
    print("2.Non-Veg Item")
    print("3.Exit")
    try:
        choice = int(input("Enter your choice:"))
    except ValueError:
        print("Enter numerical Value")
    else:
        match(choice):
            case 1 :
                order_veg()
            case 2 :
                order_nonveg()
            case 3 :
                print("Thank You !!")
                break
            case _:
                print("enter proper value!!")



