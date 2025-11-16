import UIKit

class Master {
    lazy var details = Details(master: self)
    
    init() {
        print("Master init")
    }
    
    deinit {
        print("Master deinit")
    }
}

class Details {
    
    weak var master = Master()
    
    init(master: Master) {
        self.master = master
        print("Detail init")
    }
    
    deinit {
        print("Detail deinit")
    }
    
}

func createMaster() {
    var master = Master()
    var details = master.details
}

createMaster()

// What is the bug and how does it affect memory? How can it be fixed?

/*
 There is a strong reference cycle between Master and Detail, with Master creating an instance of Detail and storing a reference to it, and Detail storing a reference to the instance of its Master creator. In both cases, references are strong, which means that none of the 2 instances will ever be deallocated, causing a memory leak.

 To solve the problem it’s necessary to break at least one of the 2 strong relationships, by using either the weak or unowned modifier. The differences between the 2 modifiers is:

 unowned: the reference is assumed to always have a value during its lifetime - as a consequence, the property must be of non-optional type.
 weak: at some point it’s possible for the reference to have no value - as a consequence, the property must be of optional type.
 In the above code example, the proper solution is to define in Detail the reference to Master as unowned:

 class Detail {
     unowned var master: Master
     ...
 }
 */
