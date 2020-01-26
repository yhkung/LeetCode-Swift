/// 378  Kth Smallest Element in a Sorted Matrix
/// - Approach: Binary Search
/// - Time Complexity: O(logn)
class Solution {
    func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
        var row = matrix.count
        var col = matrix[0].count
        var low = matrix[0][0]
        var high = matrix[row - 1][col - 1]
        while low < high {
            let mid = low + (high - low) / 2
            var count = 0
            var j = 0
            for i in 0..<row {
                for j in 0..<col {
                    if matrix[i][j] <= mid {
                        count += 1
                    }
                }
            }
            if count < k {
                low = mid + 1
            } else {
                high = mid
            }
        }
        return low
    }
}