import UIKit

// O(n²) time complexity and O(1) space complexity.
// This method will find only one duplicate number that might be Negative value and Zero and Positive value
// Input is unsorrted array value
// No need to manuplate input array
func findDuplicate_1( numbers: [Int]) -> [Int] {
    guard !numbers.isEmpty else { return [] }
    
    var i = 0, j = 0
    var duplicateValues = [Int]()
    
    while ( i < numbers.count) {
        j = i+1
        while ( j < numbers.count) {
            if numbers[i] == numbers[j] {
                duplicateValues.append( numbers[i])
            }
            j += 1
        }
        i += 1
    }
    
    return duplicateValues
}
let dupilcate_Values_1 = findDuplicate_1(numbers: [-1,-2,8,7,0,0,1, 2, 3, 4, 5, 6, 7, 8,-2,-1])
print("dupilcate_Values_1 = \(dupilcate_Values_1)")



// O(n) time complexity and O(1) space complexity
// This method find multiple duplicate values of Negative and Zero and Possitive values
// Input is sorrted array value
// No need to manuplate input array
func findDuplicate_2(numbers: [Int]) -> [Int] {
    guard !numbers.isEmpty else { return [] }
    print("\n\n")

    var j = 0
    var duplicateValues = [Int]()
    
    for (index, _) in numbers.enumerated() {
        j = index + 1
        if j < numbers.count {
            if numbers[index] == numbers[j] {
                duplicateValues.append(numbers[j])
            }
        }
    }
    
    return duplicateValues
}
let dupilcate_Values_2 = findDuplicate_2(numbers: [-2,-2,-2,-1,0,0,0,1,3,4,5,6,7,7,8])
print("dupilcate_Values_2 = \(dupilcate_Values_2)")


// O(n log(n)) time complexity and O(1) space complexity
// This method find multiple duplicate values of Negative and Zero and Possitive values
// Input is unsorrted array value
// Need to manuplate input array
func findDuplicate_3(numbers: inout [Int]) -> [Int] {
    guard !numbers.isEmpty else { return [] }
    print("\n\n")

    var j = 0
    var duplicateValues = [Int]()
    
    //Complexity: O(n log n), where n is the length of the collection. as per the apple document
    numbers = numbers.sorted()
    
    for (index, _) in numbers.enumerated() {
        j = index + 1
        if j < numbers.count {
            if numbers[index] == numbers[j] {
                duplicateValues.append(numbers[j])
            }
        }
    }
    return duplicateValues
}
var number = [8,7,1, 2, 3, 4, 5,6, 7,7,8,-2,-2,-2,-1,0,0]
let dupilcate_Values_3 = findDuplicate_3(numbers: &number)
print("dupilcate_Values_3 = \(dupilcate_Values_3)")

// O(n) time complexity and O(1) space complexity.
// This method find multiple duplicate values but only Possitive values not find the negative value and zero
// Input is unsorrted array value
// Need to manuplate input array
func findDuplicate_4(numbers: inout [Int]) -> [Int] {
    guard !numbers.isEmpty else { return []}
    print("\n\n")

    var duplicateValues = [Int]()

    for (i, _) in numbers.enumerated() {
        let indexABS = abs(numbers[i])
        
        if numbers[indexABS] < 0 {
            duplicateValues.append(indexABS)
        } else {
            numbers[indexABS] = numbers[indexABS] * -1
        }
    }
    
    return duplicateValues
}
var number1 = [8, 7, 8,7,1, 2, 3, 4, 5, 6, 7, 7, 8]
let dupilcate_Values_4 = findDuplicate_4(numbers: &number1)
print("dupilcate_Values_4 = \(dupilcate_Values_4)")


// O(n) time complexity and O(1) space complexity.
// This method find only single duplicate values and also with only Possitive values bot not find the negative value and zero
// Input is unsorrted array value
// No Need to manuplate input array
func findDuplicate_5(number: [Int]) -> Int  {
    guard !number.isEmpty else { return -1 }
    print("\n \n")

    var slow: Int = number[0]
    var fast: Int = number[number[0]]
    
    while(fast != slow) {
        slow = number[slow]
        fast = number[number[fast]]
    }
    
    slow = 0
    while(fast != slow) {
        slow = number[slow]
        fast = number[fast]
    }
    
    return slow
}

let dupilcate_Values_5 = findDuplicate_5(number:  [1,2,3,4,5,6,7,8,5])
print("dupilcate_Values_5 = \(dupilcate_Values_5)")

// Problem:
//Given a non-empty array of integers nums, every element appears twice except for one.
//Find that single one.
//a linear runtime complexity and use only constant extra space. it means O(n) O(1)
func findSingle1( numbers: [Int]) -> Int {
    print("\n \n")

    var res = 0
    for num in numbers {
        //print("res = \(res) num = \(num)  res ^ num = \(res ^ num)")
        res = res ^ num
    }
    return res;
}
let singleValue1 = findSingle1(numbers: [2,1,8 ,8,2,1,9] )
print("SingleValue1_From_Twice = \(singleValue1)")

/* think of it as
    2 -> count of 2
    1 -> count of 1
       
    if a NUM exists in 1 then put in 2 ( conunt in 2 means 2nd occurence )
       
    if a NUM  doesnt exists in 2 then put in 1 ( conunt in 1 means 1st occurence )
                
    when it comes 3rd time then it would exists in both 1 and 2
    first it will be removed from 2
    then if not in 2 then add it again in 1 (acctually removing it)
       
    simply
    1st occurence - add to 1
    2nd           - add to 2
    3rd           - add to both
       
    --Do a dry run for [2,2,3,2] for better understanding--
*/
//a linear runtime complexity and use only constant extra space. it means O(n) O(1)
func findSingle2( numbers: [Int]) -> Int {
    print("\n \n")

    var x1 = 0, x2 = 0
    for num in numbers {
        x2 ^= x1 & num
        x1 ^= (~x2) & num
    }
    return x1
}

let singleValue2 = findSingle2(numbers: [2,2,3,2,5,3,5,3,5,1] )
print("SingleValue2_From_Thrice = \(singleValue2)")
