import UIKit

/*
 Given five positive integers, find the minimum and maximum values that can be calculated by summing exactly four of the five integers. Then print the respective minimum and maximum values as a single line of two space-separated long integers.

 Example

 The minimum sum is  1+3+5+7 = 16 and the maximum sum is 3+5+7+9 = 24
 The function prints 16 24
 */
var arrays = [1,2,3,4,5]
let maxNumber = arrays.max() ?? 0
let minNumber = arrays.min() ?? 0
let sum = arrays.reduce(0, +)
print("sum min number= \(sum - maxNumber)")
print("sum max number= \(sum - minNumber)")

