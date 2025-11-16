import UIKit

/*
 Given a square matrix, calculate the absolute difference between the sums of its diagonals.

 For example, the square matrix  is shown below:

 1 2 3
 4 5 6
 9 8 9
 The left-to-right diagonal = . The right to left diagonal = . Their absolute difference is .

 Function description

 Complete the  function in the editor below.

 diagonalDifference takes the following parameter:

 int arr[n][m]: an array of integers
 Return

 int: the absolute diagonal difference
 Input Format

 The first line contains a single integer, , the number of rows and columns in the square matrix .
 Each of the next  lines describes a row, , and consists of  space-separated integers .
*/

let arr = [[1,2,3],[4,5,6],[9,8,9]]

func diagonalDifference(arr: [[Int]]) -> Int {
    // Write your code here
    var leftvalues: Int = 0
    var rightValues: Int = 0
    for (offset, value) in arr.enumerated() {
        leftvalues += value[offset]
        rightValues += value.reversed()[offset]
    }
    return abs(rightValues - leftvalues)
}

diagonalDifference(arr: arr)
