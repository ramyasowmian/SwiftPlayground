import UIKit
import Foundation

var greeting = "Hello, playground"

let dateString12 = "06:30:05PM"
let dateFormate = DateFormatter()
dateFormate.dateFormat = "h:mm:ssa"

let date12 = dateFormate.date(from: dateString12)
dateFormate.dateFormat = "HH:mm:ss"

let date24 = dateFormate.string(from: date12!)
print("date 24 hour format = \(date24)")


