/// 1143. Longest Common Sequence
/// https://leetcode.com/problems/longest-common-subsequence/
class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        if text1 == text2 {
            return text1.count
        }

        if text1.isEmpty || text2.isEmpty {
            return 0
        }

        let text1 = Array(text1)
        let text2 = Array(text2)

        let m = text1.count
        let n = text2.count

        var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)

        for i in 0..<m {
            for j in 0..<n {
                if text1[i] == text2[j] {
                    dp[i + 1][j + 1] = dp[i][j] + 1
                } else {
                    dp[i + 1][j + 1] = max(dp[i][j + 1], dp[i + 1][j])
                }
            }
        }

        return dp[m][n]
    }
}

/// Pratice #2
class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        if text1 == text2 {
            return text1.count
        }

        if text1.isEmpty || text2.isEmpty {
            return 0
        }

        let text1 = Array(text1)
        let text2 = Array(text2)

        let m = text1.count
        let n = text2.count

        var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)

        for i in 0..<m {
            for j in 0..<n {
                if text1[i] == text2[j] {
                    dp[i + 1][j + 1] = dp[i][j] + 1
                } else {
                    dp[i + 1][j + 1] = max(dp[i][j + 1], dp[i + 1][j])
                }
            }
        }

        return dp[m][n]
    }
}