#include <iostream>

using std::cout;
using std::string;

template <class T> class auto_ptr {
private:
  T *ptr;

public:
  explicit auto_ptr(T *p = 0) : ptr(p) {}
  ~auto_ptr() { delete ptr; }
  T &operator*() { return *ptr; }
  T *operator->() { return ptr; }
};

void foo0() {
  auto_ptr<string> p(new std::string("I did one P.O.F!\n"));
  cout << *p;
}

void foo1() {
  try {
    auto_ptr<string> p(new string("Oi!\n"));
    throw 20;
  } catch (int e) {
    std::cout << "Oops:" << e << "\n";
  }
}
void foo2() {
  try {
    string *p = new std ::string("Oi!\n");
    throw 20;
    delete p;
  } catch (int e) {
    std::cout << "Oops: " << e << "\n";
  }
}

int main() { foo2(); }
