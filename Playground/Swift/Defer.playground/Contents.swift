import UIKit

var greeting = "Hello, playground"

class File {
    func write(_ fileName: String) {
       print("file write \(fileName)")
    }
    
    func closeFile(_ fileName: String) {
        print("file closed \(fileName)")
    }
}

func writeLog() {
    let file = File()
    
    defer {
        file.closeFile("disaster 1")
    }
    defer {
        file.closeFile("disaster 0")
    }
    
    let hardwareStatus = "disaster"
    guard hardwareStatus == "disaster" else {
        print("disaster equals")
        return
    }
    file.write(hardwareStatus)

    let softwareStatus = "disaster not equal"
    guard softwareStatus != "disaster" else {
        print("disaster not equals ")
        return
    }
    file.closeFile(softwareStatus)
    
    defer {
        file.closeFile("disaster 3")
    }
    
    defer {
        file.closeFile("disaster 2")
    }
    
}

writeLog()
