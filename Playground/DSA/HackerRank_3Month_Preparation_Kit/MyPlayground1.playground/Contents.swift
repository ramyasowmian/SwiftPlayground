import UIKit

var greeting = "Hello, playground"


func countingSort(arr: [Int]) -> [Int] {
    var fArray = Array(repeating: 0, count: 30)
    arr.forEach({
        print($0)
      return  fArray[$0] += 1
        
    })
    return fArray
}

let arr1 = [2,2,2,4,1,6,3,5,7,0,9,8,11,25]

print(countingSort(arr: arr1))
