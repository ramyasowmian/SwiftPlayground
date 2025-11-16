import UIKit

var greeting = "Hello, playground"


struct Person: Identifiable, Hashable {
    let id: UUID
    let name: String
    let age: Int

    func hash(into myhaser: inout Hasher) {
        myhaser.combine(id)
    }
}

let person1 = Person(id: UUID(), name: "John", age: 20)
let person2 = Person(id: UUID(), name: "John1", age: 21)

print(person1)
print(person2)

print(person1 == person2)
print(person1.hashValue == person2.hashValue)
print(person1.id == person2.id)
print(person1.name == person2.name)
print(person1.age == person2.age)


var hasher = Hasher()
hasher.combine(person1)
hasher.combine(person2)
print(hasher.finalize())
