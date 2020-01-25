/// 70. Climbing Stairs
/// - Approach: Bottom-Up
/// - Time Complexity: O(n)
/// - Space Complexity: O(n)
class Solution {
    func climbStairs(_ n: Int) -> Int {
        guard n > 2 else { return n }
        var dp: [Int] = Array(repeating: 0, count: n)
        dp[0] = 1
        dp[1] = 2
        for i in 2..<n {
            dp[i] = dp[i-2] + dp[i-1]
        }
        return dp[n-1]
    }
}

/// 70. Climbing Stairs
/// - Approach: Bottom-Up, space optimized
/// - Time Complexity: O(n)
/// - Space Complexity: O(1)
class Solution {
    func climbStairs(_ n: Int) -> Int {
        guard n > 2 else { return n }
        var a = 1
        var b = 2
        for _ in 2..<n {
            let next = a + b
            a = b
            b = next
        }
        return b
    }
}
