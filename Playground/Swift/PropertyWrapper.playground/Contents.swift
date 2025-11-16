import UIKit

var greeting = "Hello, playground"

@propertyWrapper
struct Scores {
    private let minValue = 0
    private let maxValue = 100
    private var value: Int
    
    init(wrappedValue value: Int) {
        self.value = value
    }
    var wrappedValue: Int {
        get {
            return (value >= minValue && value <= maxValue) ? value : 0
        }
        set {
            value = newValue
        }
    }
}


// @Scores object con't use the globally
class SomeClass {
    @Scores var scores: Int = 0
}
var someClass = SomeClass()
someClass.scores = 22
print("someClass.scores = \(someClass.scores)")


struct SomeStructure {
    @Scores var scores: Int = 0
}
var someStructure = SomeStructure()
someStructure.scores = 2

print("someStructure.scores = \(someStructure.scores)")
