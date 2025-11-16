import UIKit



let semaphore0 = DispatchSemaphore(value: 0)
let queue0 = DispatchQueue.global()
for i in 1...5 {
    queue0.async {
        print("Task \(i) waiting")
        print("Task \(i) started")
        sleep (2)
        // Simulate work
        print("Task \(i) done")
        semaphore0.signal() // Release the lock
    }
    semaphore0.wait() // Will block if count == 0

}

print("\n\n ******************************** \n\n")

let semaphore2 = DispatchSemaphore(value: 2) // Max 2 threads allowed
let queue2 = DispatchQueue.global()
for i in 1...5 {
    queue2.async {
        print("Task \(i) waiting")
        semaphore2.wait() // Will block if count == 0
        print("Task \(i) started")
        sleep (2)
        // Simulate work
        print("wTask \(i) done")
        semaphore2.signal() // Release the lock
    }
}
