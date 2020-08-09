/// 997 - Rotting Oranges
/// Approach: BFS
/// Time Complexity: O(m * n), where m * n is the dimension of grid
/// Space Complexity: O(m * n), where m * n is the dimension of grid
class Solution {
    func orangesRotting(_ grid: [[Int]]) -> Int {
        guard !grid.isEmpty else {
            return -1
        }
        let dirs = [(1, 0), (0, 1), (-1, 0), (0, -1)]
        var grid = grid
        var queue = [(Int, Int)]()

        var counter = 0
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                counter += grid[i][j] == 1 ? 1 : 0
                if grid[i][j] == 2 {
                    queue.append((i, j))
                }
            }
        }
        var steps = 0

        while !queue.isEmpty && counter > 0 {
            steps += 1
            for _ in 0..<queue.count {
                let cur = queue.removeFirst()
                for dir in dirs {
                    let m = cur.0 + dir.0
                    let n = cur.1 + dir.1
                    if m >= 0 && m < grid.count && n >= 0 && n < grid[0].count && grid[m][n] == 1 {
                        grid[m][n] = 2
                        queue.append((m, n))
                        counter -= 1
                    }
                }
            }
        }
        return counter > 0 ? -1 : steps
    }
}