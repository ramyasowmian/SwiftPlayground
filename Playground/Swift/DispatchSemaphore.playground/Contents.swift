import UIKit


let semaphore = DispatchSemaphore(value: 2) // Max 2 threads allowed
let queue = DispatchQueue.global()

for i in 1...5 {
    queue.async {
        print("🔒 Task \(i) waiting")
        semaphore.wait()  // Will block if count == 0
        print("✅ Task \(i) started")
        sleep(2)          // Simulate work
        print("🏁 Task \(i) done")
        semaphore.signal() // Release the lock
    }
}



struct Stack<Element> {
    var items: [Element] = []
    
    mutating func push(_ item: Element) {
       return items.append(item)
    }
    
    mutating func pop(_ item: Element) -> Element {
        return items.removeLast()
    }
}

var array = Stack<Int>()
array.push(1)
array.push(2)
array.push(3)

print("Array = \(array)")
dump(array)


func findItem<T: Equatable>(_ item: T, items:[T]) -> Int? {
    for (index, value) in items.enumerated() {
        if value == item {
            return index
        }
    }
    return nil
}

// An associated type gives a placeholder name to a type that’s used as part of the protocol.
// The actual type to use for that associated type isn’t specified until the protocol is adopted.
// Associated types are specified with the associatedtype keyword.
