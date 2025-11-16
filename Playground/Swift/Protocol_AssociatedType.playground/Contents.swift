import UIKit
import Foundation



// Protocol only have the
protocol property {
    var string: String { get }
    var computedProperty: String { get }
    var computedPropertyS: String { get set }
    var strig: String {get}
    func getingfunction( value: inout Int)
    func variadic( values: Int...)
}

// Multiple class object can add into signle arrary using AnyObject
class test1 {}
class test2 {}
class test3 {}

class string {
    var cls: [AnyObject] = []
    
    func appened() {
        cls.append(test1())
        cls.append(test2())
        cls.append(test3())
        print("Array = \(cls.count),  \(cls)")
    }
}



let str = string()
str.appened()

var c: Character?




struct Movie: Codable {
    let name: String
}

struct TypeOfMovie: Codable {
    let name: String
}


struct User: Codable {
    var name: String
    var movies: [String]
}

// Type 1
protocol WebServiceProtocol {
    associatedtype Model
    func getAll(url: URL, completion: @escaping (Result<Model, Error>) -> Void)
}

class WebService: WebServiceProtocol {
    typealias Model = Movie
    
    func getAll(url: URL, completion: @escaping (Result<Model, Error>) -> Void) {
        
    }
}

class WebService1: WebServiceProtocol {
    typealias Model = User
    
    func getAll(url: URL, completion: @escaping (Result<Model, Error>) -> Void) {
        
    }
}

class WebService2: WebServiceProtocol {
    typealias Model = TypeOfMovie
    func getAll(url: URL, completion: @escaping (Result<Model, Error>) -> Void) {
        
    }
}


//Type 2
protocol APIMapperProtocol {
    associatedtype T
    associatedtype U
    func mapFromSource(_: T) -> U
}

class UserMapper: APIMapperProtocol {
    typealias T = [String : String]
    typealias U = User
    
    func mapFromSource(_ dictionary: [String : String] ) -> User {
        var user = User(name: "Ramya", movies: [String()])
        let name: String = dictionary["Movie"] ?? String()
        user.name = name
        return user
    }
}
 
class UserMapper1: APIMapperProtocol {
    typealias T = [String : [String]]
    typealias U = User
    
    func mapFromSource(_ dictionary: [String : [String]] ) -> User {
        var user = User(name: "Ramya", movies: [String()])
        let movies: [String] = dictionary["Movie"] ?? [String()]
        user.movies = movies
        return user
    }
}
 

class UserMappers: APIMapperProtocol {
    typealias T = [String : String]
    typealias U = User

    func mapFromSource(_ data: [String: String]) -> User {
        var user = User(name: "name", movies: [String()])
        let accountsName: String = data["accountname"] ?? String()
        user.name = accountsName
        return user
    }
}

class UsesApiMapperProtocol {
    func usesApiMapperProtocol<SourceType,  MappedType, APIMapperProtocolType : APIMapperProtocol>
        (apiMapperProtocol: APIMapperProtocolType, source: SourceType) -> MappedType where
        APIMapperProtocolType.T == SourceType,
        APIMapperProtocolType.U == MappedType {
        return apiMapperProtocol.mapFromSource(source)
    }
}
let dictionary: [String: String] = ["Key" : "Value" ]
let uses = UsesApiMapperProtocol()
let userModel: User = uses.usesApiMapperProtocol(apiMapperProtocol: UserMappers(), source: dictionary)

