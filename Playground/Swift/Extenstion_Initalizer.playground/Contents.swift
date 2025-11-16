import UIKit

var greeting = "Hello, playground"

struct Size {
    var width: Double = 0.0
    var height: Double = 0.0
}

struct Point {
    var x: Double = 0.0
    var y: Double = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    // Default initalization and deinitalizatio should be in original file
    init() {
        
    }
}

extension Rect {
    // Custom initalization can be extenstion 
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    
    init(center: Point, size: Size) {
        let originX = center.x - size.width / 2
        let originY = center.y - size.height / 2
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let rectOrigin = Rect(center: Point(x: 7.0, y: 7.0), size: Size(width: 5.0, height: 5.0))
print("rectOrigin = \(rectOrigin.origin)")
print("rectOrigin = \(rectOrigin.size)")
