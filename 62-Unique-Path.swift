/// 62. Unique Path
/// - Time Complexity: O(m*n)
/// - Space Complexity: O(m*n)
func uniquePaths(_ m: Int, _ n: Int) -> Int {
    guard m > 0, n > 0 else { return 0}
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