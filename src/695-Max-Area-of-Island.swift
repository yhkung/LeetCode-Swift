/// 695. Max Area of Island
/// https://leetcode.com/problems/max-area-of-island/
/// Approach: DFS
/// Time Complexity: O(mn)
/// Space Complexity: O(mn)
class Solution {
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        guard !grid.isEmpty, !grid[0].isEmpty else { return 0 }
        var grid = grid
        var maximumArea = 0
        let m = grid.count
        let n = grid[0].count

        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == 1 {
                    let area = dfs(&grid, i, j, m , n, 0)
                    maximumArea = max(maximumArea, area)
                }
            }
        }

        return maximumArea
    }

    private func dfs(_ grid: inout [[Int]], _ i: Int, _ j: Int, _ m: Int, _ n: Int, _ area: Int) -> Int{
        if !isValid(i, j, m, n) || grid[i][j] == 0 {
            return area
        }
        var newArea = area + 1
        grid[i][j] = 0
        newArea = dfs(&grid, i + 1, j, m, n, newArea)
        newArea = dfs(&grid, i, j + 1, m, n, newArea)
        newArea = dfs(&grid, i - 1, j, m, n, newArea)
        newArea = dfs(&grid, i, j - 1, m, n, newArea)
        return newArea
    }

    private func isValid(_ i: Int, _ j: Int, _ m: Int, _ n: Int) -> Bool {
        return i >= 0 && i < m && j >= 0 && j < n
    }
}