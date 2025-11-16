import UIKit

extension Array {
    subscript(safe index: Int) -> Element? {
        guard index >= startIndex && index <= endIndex else { return nil }

        return self[index]
    }
}

let array: [String] = ["1", "2", "3" ,"4","5","6","7"]
print("Array = \(String(describing: array[safe: 1]) )")


struct Grid<T> {
    var data: [[T]] = []
    
    subscript(row: Int, column: Int) -> T {
        get {
            return data[row][column]
        }
        set {
            data[row][column] = newValue
        }
    }
}

var grid = Grid(data: [ [1,2,3],
                         [4,5,6],
                         [7,8,9],
                         [10,11,12] ])

print("GRID = \(grid.data[1][1])")
print("GRID = \(grid[1,1])")

let data: [[Int]] = [
                [0,1,2],
                [3,4,5],
                [6,7,8]
           ]
print("Data = \(data[1][1])")

struct Grids<T> {
    var data: [[T]] = []
    
    subscript(row: Int, column: Int) -> T? {
        let maxCol = data.count - 1
        guard column < maxCol, column >= 0 else {
            return nil
        }
        
        let rowNumbers = data[column]
        guard row >= 0, row < (rowNumbers.count - 1) else {
            return nil
        }
        
        let number = data[column][row]
        return number
    }
}

let grids = Grids(data: [
                            [1,2,3],
                            [4,5,6],
                            [7,8,9]
                        ])
print("grird = \(grids[4,0])")
