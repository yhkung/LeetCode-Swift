class Solution {
    func minFallingPathSum(_ A: [[Int]]) -> Int {
        var dp = A
        for i in 1..<dp.count {
            for j in 0..<dp.count {
                /// Sum up previous minimum eletents
                /// dp[i-1][j-1], dp[i-1][j], dp[i-1][j+1]
                /// Using max(0, j-1) and min(dp.count-1, j+1) to handle index bound
                dp[i][j] += min(min(dp[i-1][max(0, j-1)], dp[i-1][j]), dp[i-1][min(dp.count-1, j+1)])
            }
        }        
        var minimum = Int.max
        for num in dp[dp.count-1] {
            minimum = min(num, minimum)
        }
        return minimum
    }
}