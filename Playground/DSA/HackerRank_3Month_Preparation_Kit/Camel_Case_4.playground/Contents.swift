import Foundation


enum Operation: String {
    case split      = "S"
    case combine    = "C"
}

enum Types: String {
    case method    = "M"
    case variable  = "V"
    case `class`   = "C"
}
    
func camelCase(string: String) {
    let array = string.split(separator: ";")
    let stringArray = array.map { subString -> String in
        return String(subString)
    }
    
    if stringArray.count >= 3 {
        if stringArray.first! == Operation.split.rawValue {
            performSplit(type: stringArray[1], combinedString: stringArray.last ?? "")
        } else {
            performCombine(type: stringArray[1], splitedString: stringArray.last ?? "")
        }
    }
}

func performSplit(type: Types.RawValue, combinedString: String) -> String {
    let result = combinedString.reduce("", {
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

func performCombine(type: Types.RawValue, splitedString: String) -> String {
    let splitWords = splitedString.split(separator: " ")
    var combineString = [String]()
    
    switch type {
    case Types.class.rawValue:
        combineString = splitWords.map({ $0.capitalized})
        
    case Types.method.rawValue, Types.variable.rawValue:
        if let first = splitWords.first {
            combineString.append(first.lowercased())
            combineString.append(contentsOf: splitWords.dropFirst().map({ $0.capitalized }))
        }
    default:
        print("default")
    }
    
    if type == Types.method.rawValue {
        return combineString.joined() + "()"
    } else {
        return combineString.joined()
    }
}

while let thing = readLine() {
    print(camelCase(string: thing))
}
