/// 198. House Robber
/// - Approach: Iterative Bottom-Up + memo
/// - Space Complexity: O(n)
/// - Time Complexity: O(n)
class Solution {
    func rob(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return nums[0]
        }

        if nums.count == 2 {
            return max(nums[0], nums[1])
        }

        let n = nums.count
        var dp = Array(repeating: 0, count: n)
        dp[0] = nums[0]
        dp[1] = max(nums[0], nums[1])

        for i in 2..<n {
            let next = nums[i] + dp[i - 2]
            dp[i] = max(next, dp[i - 1])
        }

        return dp[n - 1]
    }
}

/// 198. House Robber
/// - Approach: Iterative + N variables (bottom-up)
/// - Time Complexity: O(n)
/// - Space Complexity: O(1)
class Solution {
    func rob(_ nums: [Int]) -> Int {
        var prev = 0
        var curr = 0
        for n in nums {
            let tmp = curr
            curr = max(curr, prev + n)
            prev = tmp
        }
        return curr
    }
}