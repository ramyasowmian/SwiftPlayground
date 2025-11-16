import UIKit

/*
 https://www.linkedin.com/pulse/thread-concurrency-ios-giannini-charles
*/

/*
 Sync  - A synchronous task stops the execution
 Async - An asynchronous task does not stop the execution
*/

let serailQueue = DispatchQueue(label: "Serial Queue")
let concurrentQueue = DispatchQueue(label: "Concurrent Queue", attributes: .concurrent)

let operation1: (String) -> Void = { string in
    Thread.sleep(forTimeInterval: 1)
    print("\(string) Operation 1 completed")
}

let operation2: (String) -> Void = { string in
    Thread.sleep(forTimeInterval: 1)
    print("\(string) Operation 2 completed")
}

let operation3: (String) -> Void = { string in
    Thread.sleep(forTimeInterval: 1)
    print("\(string) Operation 3 completed")
}


func executeSerialSync() {
    print("Serial Sync Operation 1 started")
    serailQueue.sync {
        operation1("Serial Sync")
    }

    print("Serial Sync Operation 2 started")
    serailQueue.sync {
        operation2("Serial Sync")
    }

    print("Serial Sync Operation 3 started")
    serailQueue.sync {
        operation3("Serial Sync")
    }
}
//print("\n\n********************(Serial Sync)*************************\n\n")
//executeSerialSync()


func executeSerialAsync() {
    print("Serial Async Operation 1 started")
    serailQueue.async {
        operation1("Serial Async")
    }

    print("Serial Async Operation 2 started")
    serailQueue.async {
        operation2("Serial Async")
    }

    print("Serial Async Operation 3 started")
    serailQueue.async {
        operation3("Serial Async")
    }
}
print("\n\n********************(Serial Async)*************************\n\n")
executeSerialAsync()


func executeConcurrentSync() {
    print("Concurrent Sync Operation 1 started")
    concurrentQueue.sync {
        operation1("Concurrent Sync")
    }

    print("Concurrent Sync Operation 2 started")
    concurrentQueue.sync {
        operation2("Concurrent Sync")
    }

    print("Concurrent Sync Operation 3 started")
    concurrentQueue.sync {
        operation3("Concurrent Sync")
    }
}
//print("\n\n********************(Concurrent Sync)*************************\n\n")
//executeConcurrentSync()


func executeConcurrentAsync() {
    print("Concurrent Async Operation 1 started")
    concurrentQueue.async {
        operation1("Concurrent Async")
    }

    print("Concurrent Async Operation 2 started")
    concurrentQueue.async {
        operation2("Concurrent Async")
    }

    print("Concurrent Async Operation 3 started")
    concurrentQueue.async {
        operation3("Concurrent Async")
    }
}

print("\n\n********************(Concurrent Async)*************************\n\n")
executeConcurrentAsync()





