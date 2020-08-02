/// 1143. Longest Common Sequence  
/// https://leetcode.com/problems/longest-common-subsequence/
class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        var text1 = text1.map { String($0) }
        var text2 = text2.map { String($0) }
        var dp = Array(repeating: Array(repeating: 0, count:text2.count + 1), count:text1.count + 1)     
        for i in 0..<text1.count {
            for j in 0..<text2.count {
                if text1[i] == text2[j] {
                    dp[i+1][j+1] = 1 + dp[i][j]
                } else {
                    dp[i+1][j+1] = max(dp[i+1][j], dp[i][j+1])
                }
            }
        }
        return dp[text1.count][text2.count]
    }
}