/// 72 - Edit Distance
/// - Link: https://leetcode.com/problems/edit-distance/
/// - Approach: DP
/// - Time Complexity: *O(MN)*
class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        if word1.isEmpty || word2.isEmpty {
            return max(word1.count, word2.count)
        }

        var word1 = Array(word1)
        var word2 = Array(word2)
        var m = word1.count
        var n = word2.count

        var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)

        for i in 0...m {
            dp[i][0] = i
        }

        for j in 0...n {
            dp[0][j] = j
        }

        for i in 1...m {
            for j in 1...n {
                if word1[i] == word2[j] {
                    dp[i][j] = 1 + min(dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1] - 1)
                } else {
                    dp[i][j] = 1 + min(dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1])
                }
            }
        }

        return dp[m][n]
    }
}