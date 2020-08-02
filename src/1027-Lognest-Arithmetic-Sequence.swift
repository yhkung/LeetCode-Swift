/// https://leetcode.com/problems/longest-arithmetic-sequence/
/// 1027. Longest Arithmetic Sequence
class Solution {
    func longestArithSeqLength(_ A: [Int]) -> Int {
        guard A.count > 1 else { return A.count }
        var res = Int.min
        var dp = Array(repeating: [Int: Int](), count: A.count)
        
        for i in 0..<A.count {
            for j in 0..<i {
                let d = A[j] - A[i]
                dp[i][d] = dp[j][d, default: 1] + 1
                res = max(res, dp[i][d, default: 2])                
            }
        }        
        
        return res
    }
}