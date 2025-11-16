import UIKit

class Singleton {
    static let shared = Singleton()

    var name: String?
    private init() { }

    init(name: String ) {
        self.name = name
    }

    class  func sampleTest() {
        print("Test")
    }
}

let obj = Singleton.shared
obj.name = "Ramya"
Singleton.sampleTest()


protocol A {
    func getData()
    func postData()
}

class B : A {
    func getData() {

    }
    func postData() {

    }
}


func methods(number: Int) {
    var sum = 0
    for i in 1...number {
        sum += i
    }
    print("Sum = \(sum)")
}

methods(number: 50000)

