/// 064. Minimum Path Sum
/// - Approach: DP
/// - Time Complexity: O(m * n)
/// - Space Complexity: O(n)
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