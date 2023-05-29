class Node:
    def __init__(self):
        self.n = None
        self.e = ""


class MinStack:
    def __init__(self):
        self.stack = []

    def add(self, val: str):
        self.stack.append(val)

    def remove(self) -> Node:
        return self.stack.pop()

    def isNotEmpty(self) -> bool:
        return len(self.stack) != 0

    def getSmaller(self) -> str:
        return min(self.stack)


ms = MinStack()
ms.add("C")
ms.add("A")
ms.add("B")
print(ms.isNotEmpty())
print(ms.getSmaller())
