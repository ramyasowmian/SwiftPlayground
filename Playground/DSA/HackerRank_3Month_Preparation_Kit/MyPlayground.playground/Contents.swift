import UIKit

var greeting = "Hello, playground"

var a = 0
var b = 0
let closure = { [a] in
    
    print("captured \(a) \(b)")
}
a = 10
b = 10
closure()
// Out put: captured 0 10
