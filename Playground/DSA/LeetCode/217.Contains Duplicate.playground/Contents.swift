import UIKit

var greeting = "Hello, playground"

class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var isDuplicate: Bool = false
        let setnums: Set<Int> = Set(nums)
        
        if setnums.count < nums.count {
            isDuplicate = true
        }
        
        
        return isDuplicate
    }
}

let solution = Solution()

print(solution.containsDuplicate([1,2,3,4,1]))
