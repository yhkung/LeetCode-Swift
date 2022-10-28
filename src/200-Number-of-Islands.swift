/// 200 - Number of Islands
/// - Approach: BFS
/// - Time Complexity: O(mn)
/// - Space Complexity: O(min(m, n))
class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        guard !grid.isEmpty else { 
            return 0
        }

        let rows = grid.count
        let cols = grid.first?.count ?? 0
        var visited = Array(repeating: Array(repeating: false, count: cols), count: rows)
        var numberOfIslands = 0

        for i in 0..<rows {
            for j in 0..<cols {
                if grid[i][j] == "1" && !visited[i][j] {
                    dfs(grid, i, j, &visited)
                    numberOfIslands += 1
                }
            }
        }        

        return numberOfIslands
    }

    private func bfs(_ grid: [[Character]], _ row: Int, _ col: Int, _ visited: inout [[Bool]]) {
        let rows = grid.count
        let cols = grid.first?.count ?? 0

        var queue = [(Int, Int)]()
        visited[row][col] = true
        queue.append((row, col))

        while !queue.isEmpty {
            let (r, c) = queue.removeFirst()
            let directions = [(1, 0), (0, 1), (0, -1), (-1, 0)]
            for dir in directions {
                let nextRow = r + dir.0
                let nextCol = c + dir.1

                if nextRow >= 0 && nextRow < rows && nextCol >= 0 && nextCol < cols && !visited[nextRow][nextCol] && grid[nextRow][nextCol] == "1" {
                    queue.append((nextRow, nextCol))
                    visited[nextRow][nextCol] = true
                }
            }
        }
    }

    private func dfs(_ grid: [[Character]], _ row: Int, _ col: Int, _ visited: inout [[Bool]]) {
        let rows = grid.count
        let cols = grid.first?.count ?? 0

        guard row >= 0 && row < rows && col >= 0 && col < cols else {
            return
        }        
        if visited[row][col] {
            return
        }
        if grid[row][col] == "0" {
            return
        }

        visited[row][col] = true

        let directions = [(1, 0), (0, 1), (0, -1), (-1, 0)]
        for dir in directions {
            let nextRow = row + dir.0
            let nextCol = col + dir.1
            dfs(grid, nextRow, nextCol, &visited)
        }
    }
}