/// 200 - Number of Islands
/// - Approach: BFS
/// - Time Complexity: O(mn)
/// - Space Complexity: O(min(m, n))
class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        let m = grid.count
        let n = grid.first?.count ?? 0
        var grid = grid
        var islands = 0
        let offsets = [(0, -1), (-1, 0), (0, 1), (1, 0)]
        for r in 0..<m {
            for c in 0..<n {
                if grid[r][c] == "1" {
                    islands += 1
                    grid[r][c] = "0"

                    var queue: [(Int, Int)] = []
                    queue.append((r, c))

                    while !queue.isEmpty {
                        let cur = queue.removeFirst()
                        for offset in offsets {
                            var row = cur.0 + offset.0
                            var col = cur.1 + offset.1
                            let isValid = row >= 0 && row < m && col >= 0 && col < n
                            if isValid && grid[row][col] == "1" {
                                grid[row][col] = "0"
                                queue.append((row, col))
                            }
                        }
                    }
                }

            }
        }
        return islands
    }
}