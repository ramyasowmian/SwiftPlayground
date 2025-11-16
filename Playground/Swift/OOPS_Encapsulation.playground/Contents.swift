import UIKit

//**********************  Encapsulation ********************************** //

//Most of the time, this will work just fine
class Person {
    var weight: Int?
}

//You can even make a variable read-only publicly, and read-write privately:
class PersonType1 {
    public private(set) var weight: Int?
}

//example is useful when you want to customize the behavior of the getters and setters,for example lazily fetching the data from some external source
class PersonType2 {
    
    // Direct access of _weight is not possible due to encapsulation
    private var _weight: Int?

    var weight: Int {
        get {
            if _weight == nil {
                //fetch _weight from somewhere
            }
            return _weight!
        }
        set {
            _weight = newValue
        }
    }
}

class Encapsulation {
    // private variables declared
    // these can only be accessed by
    // public methods of class
    
    private var name: String?
    private(set) var age: String?
    
    // get method for name to access
    // private variable _name
    var getName: String? {
        return name
    }
    
    //getName and private(Set) both are same
    
    init() { }
    
    init(name: String, age: String) {
        self.name = name
        self.age = age
    }
}

// Direct access of name,age is not possible due to encapsulation
let object = Encapsulation(name: "Ramya", age: "34")
print("Name = \(object.getName)")
print("Age = \(object.age)")

// we can't do this, getName age stored property variable is only read only property
/*
let anotherTypeObject = Encapsulation()
anotherTypeObject.getName = "Ramya Sowmain"
anotherTypeObject.age = "35"
print("Name = \(anotherTypeObject.getName)")
print("Age = \(anotherTypeObject.age)")
 */



