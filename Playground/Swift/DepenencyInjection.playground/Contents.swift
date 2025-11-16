protocol Engine {
    func startEngine()
    func stopEngine()
}

class TrainEngine: Engine {
    func startEngine() {
        print("Engine started")
    }
    func stopEngine() {
        print("Engine stopped")
    }
}

protocol TrainCar {
    var numberOfSeats: Int { get }
    func attachCar(attach: Bool)
}

class RestaurantCar: TrainCar {
    var numberOfSeats: Int {
        get {
            return 30
        }
    }
    func attachCar(attach: Bool) {
        print("RestaurantCar Attach car")
    }
}

class PassengerCar: TrainCar {
    var numberOfSeats: Int {
        get {
            return 50
        }
    }
    func attachCar(attach: Bool) {
        print("PassengerCar Attach car")
    }
}

class Train1{
    let engine: Engine?
    var mainCar: TrainCar?
    
    init(engine: Engine) {
        self.engine = engine
    }
}

//Initializer or Constructor Dependency Injection
let train1 = Train1(engine: TrainEngine())
train1.engine?.startEngine()
train1.engine?.stopEngine()

class Train2 {
    var mainCar: TrainCar?
}

//Properties Dependency Injection
let train2 = Train2()
train2.mainCar = PassengerCar()
train2.mainCar?.attachCar(attach: true)
train2.mainCar?.numberOfSeats

class Train3{
    let engine: Engine?
    var mainCar: TrainCar?
    
    init(engine: Engine) {
        self.engine = engine
    }
    
    func reparkCar(trainCar: TrainCar) {
        trainCar.attachCar(attach: true)
        engine?.startEngine()
        engine?.stopEngine()
        trainCar.attachCar(attach: false)
    }
}

let train3 = Train3(engine: TrainEngine())
train3.reparkCar(trainCar: RestaurantCar())


