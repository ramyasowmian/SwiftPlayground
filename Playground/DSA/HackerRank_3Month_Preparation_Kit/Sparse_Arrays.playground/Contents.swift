import UIKit


let strings = ["1","2","3","4","5","6","1","2","3","4","5"]
let queries = ["1","2","3","10"]

var outputArray = [Int]()
queries.forEach({ val in
    outputArray.append(strings.filter({ $0 == val }).count)
})
print("outputArray = \(outputArray)")


var arry = [0,4,5,1,2,3]

arry = arry.sorted(by: { $0 < $1 })
let index  = arry.count/2
let value = arry[index]
print("Array = \(arry)")
print("Array = \(index)")
print("Array = \(value)")


