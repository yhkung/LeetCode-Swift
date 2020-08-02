/// 1368 - Minimum Cost to Make at Least One Valid Path in a Grid
/// - Link: https://leetcode.com/problems/minimum-cost-to-make-at-least-one-valid-path-in-a-grid/
/// - Approach: BFS + DFS
/// - Time Complexity: O(mn)
/// - Space Complexity: O(mn)
class Solution {
    private let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]

    func minCost(_ grid: [[Int]]) -> Int {
        let m = grid.count
        let n = grid.first?.count ?? 0
        var cost = 0
        var costs: [[Int]] = Array(repeating: Array(repeating: Int.max, count: n), count: m)
        var queue: [(Int, Int)] = []

        dfs(grid, 0, 0, &costs, cost, &queue)

        while !queue.isEmpty {
            cost += 1
            for _ in 0..<queue.count {
                let cell = queue.removeFirst()
                for i in 0..<4 {
                    dfs(grid, cell.0 + directions[i].0, cell.1 + directions[i].1, &costs, cost, &queue)
                }
            }
        }

        return costs[m - 1][n - 1]
    }

    private func dfs(_ grid: [[Int]], _ r: Int, _ c: Int, _ costs: inout [[Int]], _ cost: Int, _ queue: inout [(Int, Int)]) {
        let m = grid.count
        let n = grid.first?.count ?? 0

        if r < 0 || r >= m || c < 0 || c >= n || costs[r][c] != Int.max {
            return
        }

        costs[r][c] = cost
        queue.append((r, c))
        let next = grid[r][c] - 1
        dfs(grid, r + directions[next].0, c + directions[next].1, &costs, cost, &queue)
    }
}