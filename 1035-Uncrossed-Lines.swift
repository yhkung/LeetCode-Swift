/// 1035 - Uncrossed Lines
/// - Link: https://leetcode.com/problems/uncrossed-lines/
/// - Time: O(n^2)
/// - Space: O(n^2)
class Solution {
    func maxUncrossedLines(_ A: [Int], _ B: [Int]) -> Int {
        var m = A.count
        var n = B.count
        var dp = Array(repeating: 0, count: n + 1)
        for i in 1...m {
            for j in 1...n {
                if A[i - 1] == B[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1] + 1
                } else {
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                }
            }
        }
        return dp[m][n]
    }
}