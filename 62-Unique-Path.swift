/// 62. Unique Path
/// - Time Complexity: O(m*n)
/// - Space Complexity: O(m*n)
func uniquePaths(_ m: Int, _ n: Int) -> Int {
    guard m > 0, n > 0 else { return 0 }
    var grid = Array(repeating: Array(repeating: 1, count: m), count: n)
    for row in 1..<n {
        for col in 1..<m {
            let top = grid[row - 1][col]
            let left = grid[row][col - 1]
            grid[row][col] = top + left
        }
    }
    return grid[n-1][m-1]
}

/// 62. Unique Path - Reduce memory usage #1
/// - Time Complexity: O(m*n)
/// - Space Complexity: O(n)
class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        guard m > 0, n > 0 else { return 0 }
        var cur = Array(repeating: 1, count: n)
        var pre = Array(repeating: 1, count: n)
        for i in 1..<m {
            for j in 1..<n {
                cur[j] = pre[j] + cur[j-1]
            }
            pre = cur
        }
        return cur[n-1]
    }
}

/// 62. Unique Path - Reduce memory usage #2
/// - Time Complexity: O(m*n)
/// - Space Complexity: O(1)
class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        guard m > 0, n > 0 else { return 0 }
        var cur = Array(repeating: 1, count: n)
        for i in 1..<m {
            for j in 1..<n {
                cur[j] += cur[j-1]
            }
        }
        return cur[n-1]
    }
}
