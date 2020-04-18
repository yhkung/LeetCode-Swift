/// 064. Minimum Path Sum
/// - Approach: DP
/// - Time Complexity: O(m * n)
/// - Space Complexity: O(n)
class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        var m = grid.count
        var n = grid.first?.count ?? 0
        var sum: [[Int]] = grid
        for i in 0..<m {
            for j in 0..<n {
                if i == 0 && j == 0 { continue }
                if i == 0 && j > 0 {
                    sum[i][j] += sum[i][j - 1]
                } else if i > 0 && j == 0 {
                    sum[i][j] += sum[i - 1][0]
                } else {
                    sum[i][j] += min(sum[i - 1][j], sum[i][j - 1])
                }
            }
        }
        return sum[m - 1][n - 1]
    }
}

class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        guard !grid.isEmpty else { return 0 }
        guard let first = grid.first, !first.isEmpty else { return 0 }
        let m = grid.count
        let n = first.count
        var cur = Array(repeating: 0, count: n)

        cur[0] = grid[0][0]
        for j in 1..<n {
            cur[j] += grid[0][j] + cur[j - 1]
        }

        for i in 1..<m {
            for j in 0..<n {
                if j == 0 {
                    cur[j] += grid[i][j]
                } else {
                    cur[j] = grid[i][j] + min(cur[j], cur[j - 1])
                }
            }
        }
        return cur[n - 1]
    }
}