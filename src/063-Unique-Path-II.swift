/// 063. Unique Path II
/// - Time Complexity: O(m * n)
/// - Space Complexity: O(n) // n is column count
class Solution {
    private let OBSTACLE = 1
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        guard let first = obstacleGrid.first, !first.isEmpty else { return 0 }
        guard obstacleGrid[0][0] != OBSTACLE else { return 0 }

        var m = obstacleGrid.count
        var n = first.count
        var cur = Array(repeating: 0, count: n)

        cur[0] = 1

        // Determine first row unique paths number
        for j in 1..<n {
            cur[j] = obstacleGrid[0][j] == OBSTACLE ? 0 : cur[j - 1]
        }

        for i in 1..<m {
            for j in 0..<n {
                if obstacleGrid[i][j] == OBSTACLE {
                    cur[j] = 0
                } else {
                    // Determine first row unique paths number
                    if j == 0 {
                        cur[j] = cur[j - 1]
                    } else {
                        cur[j] += cur[j - 1]
                    }
                }
            }
        }
        return cur[n - 1]
    }
}