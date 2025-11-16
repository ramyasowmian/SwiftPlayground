import Foundation

var width: Double = 1.5
var height: Double = 2.3
let areaCoveredPerBucket: Double = 1.5

var buketsOfPaint: Int {
    get{
        let area: Double = (width * height) / areaCoveredPerBucket
        let numberOfBuckets = ceil(area)
        return Int(numberOfBuckets)
    }
    set{
        let areaCanPerBucket : Double =  Double(newValue) * areaCoveredPerBucket
        
        print("AreaCanPerBucket \(areaCanPerBucket)")
    }
}

print("\(buketsOfPaint)")

buketsOfPaint = 4

