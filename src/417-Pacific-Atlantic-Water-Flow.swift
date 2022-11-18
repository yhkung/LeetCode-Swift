class Solution {
    func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
        guard !heights.isEmpty else {
            return []
        }
        guard !heights[0].isEmpty else {
            return []
        }

        let rows = heights.count
        let cols = heights[0].count
        var pac = Array(repeating: Array(repeating: false, count: cols), count: rows)
        var atl = Array(repeating: Array(repeating: false, count: cols), count: rows)

        func dfs(_ r: Int, _ c: Int, _ visit: inout [[Bool]], _ prevHeight: Int) {
            if r < 0 || c < 0 || r >= rows || c >= cols || visit[r][c] || heights[r][c] < prevHeight {
                return
            }
            visit[r][c] = true
            let dirs = [(1, 0), (0, 1), (-1, 0), (0, -1)]
            for dir in dirs {
                dfs(r + dir.0, c + dir.1, &visit, heights[r][c])
            }
        }

        for c in 0..<cols {
            dfs(0, c, &pac, heights[0][c])
            dfs(rows - 1, c, &atl, heights[rows - 1][c])
        }

        for r in 0..<rows {            
            dfs(r, 0, &pac, heights[r][0])            
            dfs(r, cols - 1, &atl, heights[r][cols - 1])
        }

        var result = [[Int]]()
        for r in 0..<rows {
            for c in 0..<cols {
                if pac[r][c] && atl[r][c] {
                    result.append([r, c])
                }                
            }
        }

        return result
    }
}