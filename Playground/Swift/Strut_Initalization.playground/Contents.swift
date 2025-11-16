import UIKit

struct Resolution {
    let width: String
    let height: String = "height"
}
// Height has initalized, So we can't initalize again beacuse it's let property
// Width should be initalize while initalize the struct beacuse width is not initalized even thought it let property

// let resoluation = Resolution(width: "width", height: "new hight") // Compiler Error (Extra arument 'hieght in the call')

let resoluation = Resolution(width: "width")
//let resoluation1 = Resolution() // Missing argument for parameter 'width' in call
//let Resolution = Resolution() // Circular reference



/// Concustion
// The let property should be initalized during the struct iniliatztion  if it is not iniliaized already
// The let property is inialized while creating the struct, we should not initalized during the struct initaliztion

struct Resolution1 {
    let width: String
    var height: String = "height"
}
let resoluation1 = Resolution1(width: "width", height: "New Hieght")

//let resoluation11 = Resolution1(width: "width", height: "New Hieght") // Compiler error (Cannot assign to property: 'resoluation11' is a 'let' constant)
//resoluation11.height = "New new hieght"

/// Concustion
// We can't update the height even thought it's var proerty becuase during the struct initalization its let property (let resoluation11)



var resoluation111 = Resolution1(width: "width", height: "New Hieght")
resoluation111.height = "New new hieght"

struct Resolution2 {
    var width: String
    var height: String = "height"
}
let resoluation2 = Resolution2(width: "width")
let resoluation22 = Resolution2(width: "width", height: "New Hieght")

var resoluation222 = Resolution2(width: "width")
resoluation222.width = "New New Width"
resoluation222.height = "New New Hieght"

var resoluation2222 = Resolution2(width: "width",  height: "New Hieght")
resoluation2222.width = "New New Width"
resoluation2222.height = "New New Hieght"
