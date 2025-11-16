import UIKit
import Foundation


// https://blog.natanrolnik.me/dispatch-work-item
typealias DispatcherIdentifier = String

class Dispatcher {
    private var items = [DispatcherIdentifier: DispatchWorkItem]()

    private let queue: DispatchQueue

    deinit {
        cancelAllActions()
    }

    init(_ queue: DispatchQueue = .main) {
        self.queue = queue
    }

    func schedule(after timeInterval: TimeInterval,
                  with identifier: DispatcherIdentifier,
                  on queue: DispatchQueue? = nil,
                  action: @escaping () -> Void) {
        cancelAction(with: identifier)

        print("Scheduled \(identifier)")
        let item = DispatchWorkItem(block: action)
        items[identifier] = item

        (queue ?? self.queue).asyncAfter(deadline: .now() + timeInterval, execute: item)
    }

    @discardableResult
    func cancelAction(with identifier: DispatcherIdentifier) -> Bool {
        guard let item = items[identifier] else {
            return false
        }

        defer {
            items[identifier] = nil
        }

        guard !item.isCancelled else {
            return false
        }

        item.cancel()
        print("Cancelled \(identifier)")

        return true
    }

    func cancelAllActions() {
        items.keys.forEach {
            items[$0]?.cancel()
            items[$0] = nil
        }
    }
}

let dispatcher = Dispatcher()
dispatcher.schedule(after: 2, with: "first") {
    print("---> Hey, I'm first")
}

dispatcher.schedule(after: 3, with: "first") {
    print("---> No dude, I'm first")
}

dispatcher.schedule(after: 4, with: "second") {
    print("---> I'm second, but I'll be cancelled")
}

dispatcher.schedule(after: 5, with: "third") {
    print("---> And I'm third")
}

DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
    dispatcher.cancelAction(with: "second")
}

