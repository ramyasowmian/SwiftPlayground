import UIKit

var greeting = "Hello, playground"

//*************************************************** (Array) **************************************************
print("*************************** ARRAY **************************")

// Creating an Empty Array
var array: [String] = []

// Appened
array.append("one")
array.append(contentsOf: ["two","three","four"])
array += ["five"]
array.insert("zero", at: 0)
print("array = \(array)")

array[4...5] = ["six", "seven"]
print("array = \(array)")

//Remove
array.remove(at: 5)
print("array = \(array)")

// Creating an Array with a Default Value
var defaultValue: [String] = Array(repeating: "String", count: 3)
print("defaultValue array = \(defaultValue)")

// Creating an Array by Adding Two Arrays Together
let addingTwoArrays = array + defaultValue
print("addingTwoArrays =\(addingTwoArrays)")

//Accessing and Modifying an Array
print("The list count = \(addingTwoArrays.count) items.")
print("The list is empty = \(addingTwoArrays.isEmpty) items.")
print("The list is contains = \(addingTwoArrays.contains("zero")) items.")

//Iteration over the Array
for value in array {
    print("iteration value =\(value)")
}

//Iteration over the Array with index
for (index, value) in array.enumerated() {
    print("iteration index =\(index) value = \(value)")
}

//*************************************************** (Set) **************************************************

//Creating and Initializing an Empty Set
print("\n\n *************************** SET **************************")
var setInitalize = Set<Int>()
var setInitalizeWithOptional: Set<Int>?

setInitalize.insert(1)
setInitalize.insert(2)
setInitalize.insert(3)
setInitalize.insert(4)

//Accessing and Modifying an Set
print("The set count = \(setInitalize.count) items.")
print("The set is empty = \(setInitalize.isEmpty) items.")
print("The set is contains = \(setInitalize.contains(3)) items.")

//Iterating Over a Set
for value in setInitalize {
    print("Iteration over = \(value)")
}

//Iterating Over a Set with index
for (index,value) in setInitalize.enumerated() {
    print("Iteration over set with index index = \(index) value = \(value)")
}

//Performing Set Operations
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

let unionValue = oddDigits.union(evenDigits).sorted()
let intersectValue = oddDigits.intersection(evenDigits).sorted()
let subtractValue = oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
let symmaticValue = oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()

print("unionValue = \(unionValue)")
print("intersectValue = \(intersectValue)")
print("subtractValue = \(subtractValue)")
print("symmaticValue = \(symmaticValue)")

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

print("isSupset = \(houseAnimals.isSubset(of: farmAnimals))")
print("isSuperset = \(farmAnimals.isSuperset(of: houseAnimals))")
print("isStrictSubset = \(houseAnimals.isStrictSubset(of: farmAnimals))")
print("isStrictSuperset = \(houseAnimals.isStrictSuperset(of: farmAnimals))")
print("isStrictSuperset = \(farmAnimals.isStrictSuperset(of: houseAnimals))")
print("isDisjoint = \(houseAnimals.isDisjoint(with: cityAnimals))")
