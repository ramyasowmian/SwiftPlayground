import UIKit
import Foundation

protocol RandamNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandamNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}

let linearCongruentialGenerator = LinearCongruentialGenerator()
print("Here's a random number: \(linearCongruentialGenerator.random())")

class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

var dice6 = Dice(sides: 6, generator: linearCongruentialGenerator  as! RandomNumberGenerator)
for d in 1...6 {
    print("Roll = \(d)")
}
