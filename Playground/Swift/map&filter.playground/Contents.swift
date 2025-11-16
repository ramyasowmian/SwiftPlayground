import UIKit

var str = "Hello, playground"

let numbers = ["1", "2", "3", "4", "5",""]
print(numbers)
let doubled = numbers.map{ Int($0)}
print(doubled)


let numbers1:[String] = ["1", "2", "3", "4", "5","","notANumber"]
print(numbers1)
let doubled1 = numbers1.compactMap{ Int($0)}
print(doubled1)


let numbers2 = [1, 2, 4, 5]
let indexAndNum = numbers2.enumerated().map { (index,element) in
    return "\(index):\(element)"
}
print(indexAndNum)

