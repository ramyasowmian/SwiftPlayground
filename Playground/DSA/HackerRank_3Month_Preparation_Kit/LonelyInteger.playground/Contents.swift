import UIKit

/*
 Given an array of integers, where all elements but one occur twice, find the unique element.

 Example

 The unique element is .

 Function Description

 Complete the lonelyinteger function in the editor below.

 lonelyinteger has the following parameter(s):

 int a[n]: an array of integers
 Returns

 int: the element that occurs only once
 Input Format

 The first line contains a single integer, , the number of integers in the array.
 The second line contains  space-separated integers that describe the values in .

 Constraints

 It is guaranteed that  is an odd number and that there is one unique element.
 , where .
 */

func lonelyinteger(a: [Int]) -> Int {
    let mappedItems = a.map { ($0, 1) }
    print("\(mappedItems)")
    let counts = Dictionary(mappedItems, uniquingKeysWith: +)
    var result: Int = -1
    
    for (key, value) in counts where value == 1 {
        result = key
    }
    
    return result
}

lonelyinteger(a: [1,1,1,2,2,2,3,3,3,4])

