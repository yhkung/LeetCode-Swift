/// 139. Word Break - Approach 4: Dynamic Programming
/// Time Complexity: O(n^2)
/// Space Complexity: O(n)
class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let wordDictSet = Set(wordDict)
        var dp = Array(repeating: false, count: s.count + 1)
        dp[0] = true
        for i in 1...s.count {
            for j in 0..<i {
                if dp[j] == true &&
                    wordDictSet.contains(
                        String(
                            s[s.index(s.startIndex, offsetBy: j)...s.index(s.startIndex, offsetBy: i-1)]
                        )
                    ) {
                    dp[i] = true
                    break
                }
            }
        }
        return dp[s.count]
    }
}