/// 1027. Longest Arithmetic Sequence
class Solution {
    func longestArithSeqLength(_ A: [Int]) -> Int {
        guard A.count > 1 else { return A.count }
        var longest = 1
        var dp = Array(repeating: [Int: Int](), count: A.count)
        for i in 1..<A.count {
            for j in 0..<i {
                let d = A[i] - A[j]
                var len = 2
                if let times = dp[j][d] {
                    len = times + 1
                }
                let curr = dp[i][d] ?? 0
                dp[i][d] = max(curr, len)
                longest = max(longest, dp[i][d]!)
            }
        }
        return longest
    }
}