import UIKit

class Point
{

    var x: Int
    var y: Int
    let tag: String

    init()
    {
        x = 0
        y = 0
        tag = "N/A"
    }

    init(x: Int, y: Int, tag: String = "N/A")
    {
        self.x = x
        self.y = y
        self.tag = tag
    }

    lazy var listTuple: () -> String = {
        return "\(self.tag): (\(self.x), \(self.y))"
    }

    func updateInBackground()
    {
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async
        {
            self.x = 5
            self.y = 5
            print("async update listTuple= \(self.listTuple())")
        }
    }

}
let point = Point(x: 2, y: 3, tag: "point")
print(point.listTuple())
point.updateInBackground()
print(point.listTuple())

// ******************************************************************************************************

protocol Copyable
{
    init(copy: Self)
}
 
class CopyablePoint: Copyable
{
    
    var x: Int
    var y: Int
    var tag: String // now writable
    
    init()
    {
        x = 0
        y = 0
        tag = "N/A"
    }
    
    init(x: Int, y: Int, tag: String = "N/A")
    {
        self.x = x
        self.y = y
        self.tag = tag
    }
    
    required init(copy: CopyablePoint)
    {
        self.x = copy.x
        self.y = copy.y
        self.tag = copy.tag
    }
 
    lazy var listTuple: () -> String = {
        return "\(self.tag): (\(self.x), \(self.y))"
    }
    
}
 
print("\n**********************\n")

let copyablePoint = CopyablePoint(x: 2, y: 3, tag: "point")
print(copyablePoint.listTuple())
//Changes to pointCopy did not affect the original point instance.
let copy = CopyablePoint(copy: copyablePoint)
copy.tag = "pointCopy"
copy.x = 7
print(copy.listTuple())
print(copyablePoint.listTuple())

// ******************************************************************************************************

protocol Copying
{
    func copy() -> Self
}
 
class CopyingPoint: Copying
{
    
    var x: Int
    var y: Int
    var tag: String
    
    init()
    {
        x = 0
        y = 0
        tag = "N/A"
    }
    
    required init(x: Int, y: Int, tag: String = "N/A")
    {
        self.x = x
        self.y = y
        self.tag = tag
    }
    
    func copy() -> Self
    {
        return type(of: self).init(x: self.x, y: self.y, tag: self.tag)
    }
 
    lazy var listTuple: () -> String = {
        return "\(self.tag): (\(self.x), \(self.y))"
    }
    
} // end class Point
 
print("\n**********************\n")
let copyingPoint = CopyingPoint(x: 5, y: 5, tag: "point")
print(copyingPoint.listTuple())
let copyPoint = copyingPoint.copy()
copyPoint.tag = "pointCopy"
copyPoint.x = 11
print(copyPoint.listTuple())
print(copyingPoint.listTuple())
