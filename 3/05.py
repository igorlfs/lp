NULL = -1  # The null link


class HeapManager:
    """Implements a very simple heap manager."""

    def __init__(self, memorySize):
        """Parameter memorySize is the array of data that
        we will use to represent the memory."""
        self.memory = [0] * memorySize
        self.memory[0] = self.memory.__len__()
        self.memory[1] = NULL
        self.freeStart = 0

    def allocate(self, requestSize):
        """Allocates a block of data, and return its address.
        The parameter requestSize is the amount of space that must be allocaed."""
        size = requestSize + 1
        # Do first-fit search: linear search of the free list for the
        # first block of sufficient size.
        p = self.freeStart
        lag = NULL
        while p != NULL and self.memory[p] < size:
            lag = p
            p = self.memory[p + 1]
        if p == NULL:
            raise MemoryError()
        nextFree = self.memory[p + 1]
        # Now p is the index of a block of sufficient size, lag is the index
        # of ’ps predecessor in the free list , or NULL , and nextFree is the index
        # of ’ps successor in the free list , or NULL . If the block has more space
        # than we need , carve out what we need from the front and return the
        # unused end part to the free list .
        unused = self.memory[p] - size
        if unused > 1:
            nextFree = p + size
            self.memory[nextFree] = unused
            self.memory[nextFree + 1] = self.memory[p + 1]
            self.memory[p] = size
        if lag == NULL:
            self.freeStart = nextFree
        else:
            self.memory[lag + 1] = nextFree
        return p + 1

    def deallocate(self, address):
        address = address - 1
        p = self.freeStart
        lag = NULL
        while p != NULL and p < address:
            lag = p
            p = self.memory[p + 1]
        if lag != NULL:
            self.memory[lag + 1] = address
        else:
            self.freeStart = address
        self.memory[address + 1] = p


# h = HeapManager(14)
# a = h.allocate(4)
# _ = h.allocate(2)
# b = h.allocate(3)
# h.deallocate(a)
# h.deallocate(b)
# c = h.allocate(2)
# print("d = ", c)
# print("h.memory = ", h.memory)
