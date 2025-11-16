import UIKit

var greeting = "Hello, playground"

// Capture values
var a = 0
var b = 0
let closure = { [a] in
    print("captured \(a) \(b)")
}
a = 10
b = 10
closure()
// Out put: captured 0 10


//This distinction isn’t visible when the captured variable’s type has reference.
class SimpleClass {
    var value: Int = 0
}
var x = SimpleClass()
var y = SimpleClass()
let closure1 = { [x] in
    print(x.value, y.value)
}
x.value = 10
y.value = 10
closure1()
// Out put:  10 10


print("\n******************** (Capture List and Capture Value) ********************** \n")

var pictureName: String = "Test picture name"
class Capture {
    
    var pictureName: String = "Inialize value"

    //Multiple Trailing Closure Sample
    func checkPictureName(from picture: String, completion: (Bool) -> Void, onFailure: () -> Void) {
        if picture == "photo.jpg" {
            completion(true)
        } else {
            onFailure()
        }
    }
    
    func captureListValidation() {
        print("Capture Values pictureName: \(pictureName)")

        self.checkPictureName(from: "photo.jpg") { [weak self] picture in
            guard let self = self else { return }
            self.pictureName = "Caputered Picture Name *"
            print("Capture Values pictureName: \(self.pictureName)")
        } onFailure: {
            print("Don't the picture name is wrong")
        }
        pictureName = "Picture name"
        print("Capture Values pictureName: \(pictureName)")
    }
    
    func captureListValidationWith_Variables() {
        self.checkPictureName(from: "photo.jpg") { [pictureName] picture in
            self.pictureName = "inner value"
            print("Capture Values of  pictureName: = \(pictureName)")
            print("Capture Values self.pictureName: \(self.pictureName)")
        } onFailure: {
            print("Don't the picture name is wrong")
        }
        pictureName = "Outer value"
        print("Capture Values: \(pictureName)")
    }
}

let cap = Capture()
//cap.captureListValidation()
print("\n\n")
cap.captureListValidationWith_Variables()


//https://stackoverflow.com/questions/68695701/how-closure-captures-values-in-swift


