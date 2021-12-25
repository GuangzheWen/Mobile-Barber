protocol FullyNamed {
  var fullName: String { get }
}

struct Person: FullyNamed {
  var fullName: String
    mutating func changeName(newName: String)  {
        fullName = newName
    }
}

var john = Person(fullName: "John Appleseed")

print(john.fullName)

john.fullName  = "123"
print(john.fullName)

john.changeName(newName: "456")
print(john.fullName)


extension Int {
  func repetitions(task: () -> Void) {
    for _ in 0 ..< self {
      task()
    }
  }
}
3.repetitions (task: {
    print("123")
})


extension Int {
  mutating func square() {
    self = self * self
  }
}


var someInt = 3
print(someInt)
someInt.square()
print(someInt)


