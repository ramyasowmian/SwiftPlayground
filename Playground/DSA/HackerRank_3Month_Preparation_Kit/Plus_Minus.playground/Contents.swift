import UIKit

/*
 Given an array of integers, calculate the ratios of its elements that are positive, negative, and zero. Print the decimal value of each fraction on a new line with  places after the decimal.

 Note: This challenge introduces precision problems. The test cases are scaled to six decimal places, though answers with absolute error of up to  are acceptable.

 Example

 There are  elements, two positive, two negative and one zero. Their ratios are ,  and . Results are printed as:
2/5 = 0.400000 2/5 = 0.400000 1/5 = 0.200000
 0.400000
 0.400000
 0.200000
 */

let arr = [-1,-2,0,1,2]
let count = arr.count
let neg = arr.filter({ $0 < 0 }).count
let zero = arr.filter({ $0 == 0 }).count
let post = arr.filter({ $0 > 0}).count

let n: Float = Float(neg) / Float(count)
let z: Float = Float(zero) / Float(count)
let p: Float = Float(post) / Float(count)

print(String(format: "%.6f", p))
print(String(format: "%.6f", n))
print(String(format: "%.6f", z))
