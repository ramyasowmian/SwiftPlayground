import UIKit

/*
class Resolution {
    let width: String
    let height: String = "Height"
}
 */
// Compiler Error - Class 'Resolution' has no initializers

class Resolution1 {
    let width: String = ""
    let height: String = "Height"
}
//let Resolution1 = Resolution(width: "RE", height:"ddd") // Compiler Error:  Argument passed to call that takes no arguments
//let Resolution1 = Resolution1() //Circular reference
 let resolution = Resolution1()

class Resolution2 {
    let width: String = "width"
    let height: String = "Height"
    let area: String
    
    init(area: String) {
        self.area = area
    }
}
let resolution2 = Resolution2(area: "Area")
//resolution2.width = "New Width" //  Compiler error Cannot assign to property: 'width' is a 'let' constant
print("Resolution2 area   = \(resolution2.area) width  = \(resolution2.width) height = \(resolution2.height)")
// Output Resolution2 area   = Area width  = width height = Height


/// Conculation
// let property it should be initalized while creating the class
// if not then should be initalized in the init method and the real value should be pass while class initalization


class Resolution3 {
    var width: String?
    var height: String?
    let area: String?
    init(area: String) {
        self.area = area
    }
}
let resolution3 = Resolution3(area: "Area")
resolution3.width = "New Width"
resolution3.height = "New Height"
print("Resolution3 area   = \(resolution3.area) width  = \(resolution3.width) height = \(resolution3.height)")
// Output Resolution3 area   = Optional("Area") width  = Optional("New Width") height = Optional("New Height")

