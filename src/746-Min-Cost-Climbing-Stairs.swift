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
        guard cost.count >= 2 else {
            return 0
        }
        let n = cost.count        
        var twoStepsBefore = cost[0]
        var oneStepsBefore = cost[1]

        for i in 2..<n {
            let curr = cost[i] + min(twoStepsBefore, oneStepsBefore)
            twoStepsBefore = oneStepsBefore
            oneStepsBefore = curr
        }
        
        return min(oneStepsBefore, twoStepsBefore)
    }
}