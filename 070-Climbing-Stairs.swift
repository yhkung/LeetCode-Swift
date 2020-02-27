class Solution {
    func climbStairs(_ n: Int) -> Int {
        return climbStairs(n, maxSteps: 2)
    }

    private func climbStairs(_ n: Int, maxSteps: Int) -> Int {

        /// We only needs (maxSteps + 1) size array to keep tracking previous number of ways
        let size = maxSteps + 1

        /// dp is an array that holds the number of disctincts ways
        var dp: [Int] = [Int](repeating: 0, count: size)

        dp[0] = 1
        for i in 1...n {

            /// dp[n] = dp[n - 1] + dp[n - 2] +... dp[n - maxSteps]
            var sum = 0
            for step in 1...maxSteps {
                guard i >= step else { continue }
                sum += dp[(i - step) % size]
            }
            dp[i % size] = sum
        }
        return dp[n % size]
    }
}

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