import UIKit

var greeting = "Hello, playground"

var numbers: [Int] = [5,1,6,8,9,2,7,3]

var firstMin: Int = numbers[0]
var secondMin: Int = numbers[0]
for num in numbers {
    if(firstMin > num) {
        firstMin = num
    }
}
print(firstMin)

for num in numbers {
    if firstMin != num {
        if(secondMin > num) {
            secondMin = num
        }
    }
}

print(secondMin)



var max: Int = numbers[0]
for num in numbers {
    if max < num{
        max = num
    }
}
print("Max = \(max)")
