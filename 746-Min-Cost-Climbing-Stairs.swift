/// 746. Min Cost Climbing Stairs
/// Time Complexity: O(n)
/// Space Complexity: O(n)
class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {                    
        var dp = Array(repeating: 0, count: cost.count)
        dp[0] = cost[0]
        dp[1] = cost[1]
        for i in 2..<cost.count {
            dp[i] = cost[i] + min(dp[i - 1], dp[i - 2])
        }        
        return min(dp[dp.count - 1], dp[dp.count - 2])
    }
}

/// 746. Min Cost Climbing Stairs
/// Time Complexity: O(n)
/// Space Complexity: O(1)
class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var dp1 = 0
        var dp2 = 0
        for i in 0..<cost.count {
            let dp = cost[i] + min(dp1, dp2)
            dp2 = dp1
            dp1 = dp0
        }
        return min(dp1, dp2)
    }
}