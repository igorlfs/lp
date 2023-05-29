class Animal:
    def __init__(self, name):
        self.name = name

    def __str__(self):
        return self.name + " is an animal"

    def eat(self):
        print(self.name + ", which is an animal, is eating.")


class Mammal(Animal):
    def __str__(self):
        return self.name + " is a mammal"

    def suckMilk(self):
        print(self.name + ", which is a mammal, is sucking milk.")


class Dog(Mammal):
    def __str__(self):
        return self.name + " is a dog"

    def bark(self):
        print(self.name + " is barking rather loudly.")

    def eat(self):
        print(self.name + " barks when it eats.")
        self.bark


a1 = Animal("Pavao")
a2 = Mammal("Tigre")
a3 = Dog("Krypto")
print(a1)  # 1
print(a2)  # 2
print(a3)  # 3
a1.eat()  # 4
a2.suckMilk()  # 5
a2.eat()  # 6
a3.bark()  # 7
a3.suckMilk()  # 8
a3.eat()  # 9
a1.bark()  # 10
a1 = a3
a1.bark()  # 11
