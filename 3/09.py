class Node:
    def __init__(self):
        self.n = None
        self.e = ""


class Stack:
    def __init__(self):
        self.stack = []

    def add(self, val: str):
        self.stack.append(val)

    def remove(self) -> Node:
        return self.stack.pop()

    def isNotEmpty(self) -> bool:
        return len(self.stack) != 0


s = Stack()
s.add("Baltimore")
s.add("Lord")
s.add("Sir")
print(s.isNotEmpty())
while s.isNotEmpty():
    print(s.remove())
