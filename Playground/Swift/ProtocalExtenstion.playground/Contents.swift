import UIKit

protocol MenuItem {
    var order: Int {get}
}

extension MenuItem {
    static var menuItemSorter: (MenuItem, MenuItem) -> Bool {
        return { $0.order < $1.order }
    }
}

class BigItem : MenuItem {
    var order: Int = 1
}

let bigItems = [BigItem(), BigItem()]

//let sorter = MenuItem.menuItemSorter

let sorter = BigItem.menuItemSorter

