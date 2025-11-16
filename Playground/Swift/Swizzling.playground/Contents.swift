import Foundation

class TestSwizzling : NSObject {

    private let swizzlings: (AnyClass, Selector, Selector) -> () = { forClass, originalSelector, swizzledSelector in
        guard let originalMethod = class_getInstanceMethod(forClass, originalSelector),
              let swizzledMethod = class_getInstanceMethod(forClass, swizzledSelector) else { return }
        method_exchangeImplementations(originalMethod, swizzledMethod)
    }
    
    @objc dynamic func methodOne()->Int{
        return 1
    }
}

extension TestSwizzling {
    
    @objc func methodTwo()->Int{
        // It will not be a recursive call anymore after the swizzling
        return 2
    }
    
    //In Objective-C you'd perform the swizzling in load(),
    //but this method is not permitted in Swift
    func swizzle() {
        let originalSelector = #selector(TestSwizzling.methodOne)
        let swizzledSelector = #selector(TestSwizzling.methodTwo)
        swizzlings(TestSwizzling.self, originalSelector, swizzledSelector)
    }
}

var c = TestSwizzling()
print([c.methodOne(), c.methodTwo()])  // [1, 2]
c.swizzle()                            // swizzled!
print([c.methodOne(), c.methodTwo()])  // [2, 1]
