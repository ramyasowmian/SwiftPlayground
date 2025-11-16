import Foundation

enum StringType {
    case `class`, method, variable
    
    static func getType(with string: String) -> StringType {
        if string == "C" {
            return .class
        } else if string == "M" {
            return .method
        } else if string == "V" {
            return .variable
        }
        return .variable
    }
}

typealias StringParam = (type: StringType, value: String)

func camelCase(s: String) -> String {
    let parts = s.split(separator: ";")
    let stringType = StringType.getType(with: parts[1].uppercased())
    let stringToManipulate = String(parts.last ?? "")
    var result = ""
    
    if parts.first == "S" {
        result = split(combinedString: StringParam(type: stringType, value: stringToManipulate))
    } else {
        result = combine(splittedString: StringParam(type: stringType, value: stringToManipulate))
    }
    return result
}

func split(combinedString: StringParam) -> String {
    let result = combinedString.value.reduce("", {
        if !$1.isLetter {
            return $0
        } else if $1.isLowercase {
            return $0 + String($1)
        } else if $1.isUppercase {

            if $0 == "" {
                return String($1).lowercased()
            } else {
                return $0 + " " + String($1).lowercased()
            }
        } else {
            return $0
        }
    })
    return result
}

func combine(splittedString: StringParam) -> String {
    let words = splittedString.value.split(separator: " ")
    var camelCasedWords = [String]()
    
    switch splittedString.type {
    case .class:
        camelCasedWords = words.map({ $0.prefix(1).uppercased() + $0.dropFirst() })
        
    case .method, .variable:
        if let first = words.first {
            camelCasedWords.append(first.lowercased())
            camelCasedWords.append(contentsOf: words.dropFirst().map({ $0.prefix(1).uppercased() + $0.dropFirst() }))
        }
    }
    
    if splittedString.type == .method {
        return camelCasedWords.joined() + "()"
    } else {
        return camelCasedWords.joined()
    }
}

let camelcase = camelCase(s: "C;C;duck Duck Do")

while let thing = readLine() {
    print(camelCase(s: thing))
}
