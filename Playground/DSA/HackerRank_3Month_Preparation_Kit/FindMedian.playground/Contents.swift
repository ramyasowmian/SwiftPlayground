import UIKit

var array = [0,1,3,2,5,4]
array = array.sorted(by: { $0 < $1 })

let index = array.count/2
print("Array = \(array)")

print("Array = \(index)")
print("Array = \(array[index])")



