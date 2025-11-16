import UIKit

var greeting = "Hello, playground"

//    let timerInterval: Double =  1.0
//    var increment  = 0
//    let timerLoop: Timer? = Timer.scheduledTimer(withTimeInterval: timerInterval, repeats:true) { _  in
//        print("timer called \(increment)")
//        increment += 1
//    }

//    if let timer = timerLoop {
//        RunLoop.current.add(timer, forMode: .default)
//        print("timer going to fire")
//        timer.fire()
//    }

var timer: Timer?
func startTimer() {
    timer = Timer(timeInterval: 1.0, repeats: true) { _ in
        print("Fired!")
    }
    
    if let timer = timer {
        RunLoop.current.add(timer, forMode: .default)
        print("timer going to fire")
        timer.fire()
    }
  
}

startTimer()


