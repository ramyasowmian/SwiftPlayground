import UIKit

var greeting = "Hello, playground"

class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
         var sum = 0, sum_nums = 0
    
        for (index,value) in nums.enumerated() {
            sum = sum + index
            sum_nums = sum_nums + value
        }

        sum = sum + nums.count

        return ( sum - sum_nums)
    }
    
}
