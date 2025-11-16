import UIKit

class Animal {
    var name: String
    init(n:String){
        name = n
    }
}

class Human : Animal {
    func code() {
        print("Type Code Human")
    }
}

class Fish : Animal {
    func breathUnderWater(){
        print("Fish breathing under water")
    }
}

let angela = Animal(n: "Angela")
let jack = Human(n: "Jack")
let nemo = Fish(n: "nemo")

let neighbours = [angela,jack,nemo]

let neighbour1: Animal? = neighbours[1]
if neighbour1 is Human {
    print("First Neighbour is Human")
}

func findingNemo(from animals:[Animal]) {
    for animal in animals {
        if animal is Fish {
            let fish = animal as! Fish
            fish.breathUnderWater()
        }
    }
}
findingNemo(from: neighbours)

let neighbour2 = neighbours[2]
if let safeDowncasting = neighbour2 as? Fish {
    safeDowncasting.breathUnderWater()
}
else{
    print("Casting Has Failed ")
}

//Any , AnyObject, NSObject
//________________________________

let angelas = Animal(n: "Angela")
let jacks = Human(n: "Jack")
let nemos = Fish(n: "nemo")
let num = 12
let str = "String"
let neighbours_with_Any: [Any] = [angelas, jacks, nemos, num]
let neighbours_with_AnyObject: [AnyObject] = [angela,jack,nemo]
