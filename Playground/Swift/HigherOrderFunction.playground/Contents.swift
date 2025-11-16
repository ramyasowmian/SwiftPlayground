import UIKit
import Foundation


var array: [String]?
array = []
array?.append("tet ")
print("Test array = \(array)")

// *******************************************(Map with Array )*******************************************************
var numbers = [2, 5, 3, 9, 15, 12, 8, 17, 20, 11]
var doubled =  [Int]()
doubled = numbers.map { $0 * 2 }
print("Map doubled = \(numbers)")

// *******************************************(Map with Dictionary )*******************************************************

// wants to change both key and value need to use map higher order funcation
var infoDictionary = [String: String]()
infoDictionary["name"] = "Ramya"
infoDictionary["city"] = "Chennai"
infoDictionary["job"] = "developer"
infoDictionary["hobby"] = "compert games"

let keys = infoDictionary.map { $0.key }
let values = infoDictionary.map { $0.value }
let info = infoDictionary.map { $0 } // Each element of the info array is a tuple
let newInfo = Dictionary(uniqueKeysWithValues: info) // Create same dictionary using that tuple array
let updatedKeysAndValues = infoDictionary.map { ($0.key.uppercased(), $0.value.capitalized) }
let updatedKeysAndValuesAnotherWay = infoDictionary.map { ($0.uppercased(), $1.capitalized)}
let capitalizedInfo = Dictionary(uniqueKeysWithValues: infoDictionary.map { ($0.uppercased(), $1.capitalized)})
print("keys = \(keys)")
print("values = \(values)")
print("info = \(info)")
print("newInfo = \(newInfo)")
print("updatedKeysAndValues = \(updatedKeysAndValues)")
print("updatedKeysAndValuesAnotherWay = \(updatedKeysAndValuesAnotherWay)")
print("capitalizedInfo = \(capitalizedInfo)")

// MapValues – A Variation Of Map
// In Dictionary map means have key and values
// In Dictionary mapvalues means have only the values
let updatedInfo = infoDictionary.mapValues { $0.capitalized } // wants to change values only in the dictionary then need to use mapValues higher order funcation
print("updatedInfo = \(updatedInfo)")

// Map And Custom Types

class Tester {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let arrayOfTester = [Tester(name: "Tester1", age: 10), Tester(name: "Tester2", age: 20), Tester(name: "Tester3", age: 30)]
let testerAgeOnly = arrayOfTester.map {$0.age}
let testerNameOnly = arrayOfTester.map {$0.name}
print("TesterAgeOnly = \(testerAgeOnly)")
print("testerNameOnly = \(testerNameOnly)")

// CompactMap -  compactMap function is pretty much similar to map, with a great difference though; the resulting array does not contain any nil values.
// Obviously the number of elements in the resulting array is different than the number of elements in the original array if there are nil values. Consider this fact in case the number of elements somehow matters in your code. In that case maybe you should stick to map and use a default value in case nil is found in the original array. Modifying a bit the above, the following map function doubles the non-nil values, but it returns -1 in case it finds nil:


//https://www.appcoda.com/higher-order-functions-swift/

// *******************************************(flatMapped with Array )*******************************************************

let marks = [[3, nil, 5], [2, 5, 3], [1, 2, 2], [5, 5, 4], [3, 5, 3]]

let flatMarks = marks.flatMap{$0}

print("Flatmap = \(flatMarks)")

let numbersArray = [1, 2, 3, 4, 10, 11, 15]

let mapped = marks.map { $0 }
// [[1], [2, 2], [3, 3, 3], [4, 4, 4, 4]]

let flatMapped = marks.flatMap { $0 }
// [1, 2, 2, 3, 3, 3, 4, 4, 4, 4]

print("Map numbersArray =  \(mapped)")
print("Flatmap numbersArray =  \(flatMapped)")

// *******************************************(Reduce with Array )*******************************************************
var product = 1
for number in numbersArray {
    product *= number
}

let multiplayStartwithOne = numbersArray.reduce(1) { (partialResult, number) -> Int in
    return partialResult + number
}

let multiplayStartwithFive = numbersArray.reduce(5) { (partialResult, number) -> Int in
    return partialResult * number
}

print("Reduce product = \(multiplayStartwithFive)")
print("Reduce multiplayStartwithOne = \(multiplayStartwithOne)")
print("Reduce multiplayStartwithFive = \(multiplayStartwithFive)")

struct Planet {
    let name: String
    let distanceFromSun: Double
}

let planets = [
    Planet(name: "Mercury", distanceFromSun: 0.387),
    Planet(name: "Venus", distanceFromSun: 0.722),
    Planet(name: "Earth", distanceFromSun: 1.0),
    Planet(name: "Mars", distanceFromSun: 1.52),
    Planet(name: "Jupiter", distanceFromSun: 5.20),
    Planet(name: "Saturn", distanceFromSun: 9.58),
    Planet(name: "Uranus", distanceFromSun: 19.2),
    Planet(name: "Neptune", distanceFromSun: 30.1)
]

let result1 = planets.map { $0.name }
let result2 = planets.reduce(0) { $0 + $1.distanceFromSun }

print("Reduce result1 = \(result1)")
print("Reduce result2 = \(result2)")

// *******************************************(Contains with Array )*******************************************************

let hasNumbersLessThan5 = numbersArray.contains { (number) -> Bool in
    return number < 5
}

print("Contains hasNumbersLessThan5 = \(hasNumbersLessThan5)")

class Staff {
    enum Gender {
        case male, female
    }

    var name: String
    var gender: Gender
    var age: Int

    init(name: String, gender: Gender, age: Int) {
        self.name = name
        self.gender = gender
        self.age = age
    }
}

let staff = [Staff(name: "Nick", gender: .male, age: 37),
             Staff(name: "Julia", gender: .female, age: 29),
             Staff(name: "Tom", gender: .male, age: 41),
             Staff(name: "Tony", gender: .male, age: 45),
             Staff(name: "Emily", gender: .female, age: 42),
             Staff(name: "Irene", gender: .female, age: 30)]

let hasStaffOver40 = staff.contains { $0.age > 40 }
print("hasStaffOver40", hasStaffOver40)
// Prints true
 
let hasMalesOver40 = staff.contains { $0.gender == .male && $0.age > 40 }
print("hasMalesOver40", hasMalesOver40)
// Prints true
 
let hasMalesUnder30 = staff.contains { $0.gender == .male && $0.age < 30 }
print("hasMalesUnder30", hasMalesUnder30)

// *******************************************(RemoveAll with Array )*******************************************************
var numbersArrays = [1, 2, 3, 4, 10, 11, 15]
numbersArrays.removeAll { $0 < 5 }

print("removeAllLessThanFive =\(numbersArrays)")

// ******************************************* (Sortted) *******************************************************

let d = ["john": 23, "james": 24, "vincent": 34, "louis": 29, "ramya": 21]
let x = d.sorted(by: { $0.0 < $1.0 })
let x1 = d.sorted(by: { $0.key < $1.key })
let x2 = d.keys.sorted()

print("sorted by key option1 = \(x)")
print("sorted by key option2 = \(x1)")
print("sorted by key option2 = \(x2)")



let y = d.sorted(by: { $0.1 < $1.1 })
let y1 = d.sorted(by: { $0.value < $1.value})
let y2 = d.sorted(by: >)
print("sorted by value option1 = \(y)")
print("sorted by value option2 = \(y1)")
print("sorted by value option3 = \(y2)")

// ******************************************* (Split) *******************************************************

let message = "Hello World!"
let splitResult = message.split { (char) -> Bool in
    return char == " "
}
print("Split =\(splitResult)")

let splitResult1 = message.split { $0 == " " }
print("Split =\(splitResult1)")

let sentence = "This message is going to be broken in pieces!"
 
let splitOnce = sentence.split(maxSplits: 1, whereSeparator: { $0 == " " })
 
print("splitOnce = \(splitOnce)")

let messageWithMoreSpace = "This message is going to    be broken in pieces!"

let emptySequences = messageWithMoreSpace.split(omittingEmptySubsequences: false, whereSeparator: { $0 == " " })
 
print("emptySequences = \(emptySequences)")

let paragraph = "This paragraph will be separated in parts. Based on the periods and the exclamation mark! There will be three strings!"
 
let sentences = paragraph.split { $0 == "." || $0 == "!" }
 
print("sentences = \(sentences)")


let minuteInterval = 5
let minutes = 60
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    // render the tick mark every 5 minutes (0, 5, 10, 15 ... 45, 50, 55)
    print("tickMark = \(tickMark)")
}
