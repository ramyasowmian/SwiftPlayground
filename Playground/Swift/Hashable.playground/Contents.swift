
struct Employee: Hashable {
  
 var name: String
 var salary: Int

 // create a hash() function to only compare  age property
 func hash(into hasher: inout Hasher) {
   hasher.combine(name)
 }
    
}

// initialize two objects with different values for salary property
let obj1 = Employee(name: "Sabby", salary: 349879)
let obj2 = Employee(name: "Sabby", salary: 422532)

print(obj1.hashValue)
print(obj2.hashValue)







struct Person {
    let name: String
}

struct Post {
    let text: String
}

struct UserAccount_For_Dictionary: Hashable {
    
    let accountIdentifier: Person

    func hash(into hasher: inout Hasher) {
        hasher.combine(accountIdentifier.name)
    }
    
    static func == (lhs: UserAccount_For_Dictionary, rhs: UserAccount_For_Dictionary) -> Bool {
        lhs.accountIdentifier.name == rhs.accountIdentifier.name
    }
}

var dictionary: [UserAccount_For_Dictionary: Any] = [
                                                        UserAccount_For_Dictionary(accountIdentifier: Person(name: "a")) : [Post(text: "first"), Post(text: "second")],
                                                        UserAccount_For_Dictionary(accountIdentifier: Person(name: "b")) : [Post(text: "third"), Post(text: "fourth")]
                                                    ]

if let firstPost = dictionary[UserAccount_For_Dictionary(accountIdentifier: Person(name: "a"))] {
    print(firstPost)
}


