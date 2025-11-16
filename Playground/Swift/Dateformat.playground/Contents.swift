import UIKit
import Foundation
class DateFormat {
    private static var _persistenceDF: DateFormatter?
    static var persistenceDF: DateFormatter {
        if _persistenceDF == nil {
            _persistenceDF = DateFormatter()
            _persistenceDF!.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            _persistenceDF!.timeZone = TimeZone.init(abbreviation: "UTC")
            _persistenceDF!.locale = Locale(identifier: "in")
        }
        return _persistenceDF!
    }
    
    private static var _persistenceDF1: DateFormatter?
    static var persistenceDF1: DateFormatter {
        if _persistenceDF1 == nil {
            _persistenceDF1 = DateFormatter()
            _persistenceDF1!.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSX"
            _persistenceDF1!.timeZone = TimeZone.init(abbreviation: "UTC")
            _persistenceDF1!.locale = Locale(identifier: "in")
        }
        return _persistenceDF1!
    }
}
var serverDateString = "2021-03-04T14:05:15.953Z"
var dataSyncDT: Date? = DateFormat.persistenceDF.date(from: serverDateString)
var localDateString =  DateFormat.persistenceDF.string(from: dataSyncDT!)

var localDateString1 =  DateFormat.persistenceDF1.string(from: dataSyncDT!)



let number = 0.1
// Use ceil to remove the fractional part and round up.
let result = ceil(number)


let number1 = 1.1
// Use floor to remove the fractional part and round down.
let floor1 = floor(number1)
