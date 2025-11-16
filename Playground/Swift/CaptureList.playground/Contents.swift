import UIKit
import Foundation


var greeting = "Hello, playground"

func captureList(incrementBy amount: Int) -> () -> Int {
    var total = 0
    return { [amount] in
        total += amount
        return total
    }
}


let val1 = captureList(incrementBy: 10)
let val2 = captureList(incrementBy: 10)
let val3 = captureList(incrementBy: 10)


print("Val = \(val1())")
print("Val = \(val2())")
print("Val = \(val3())")



