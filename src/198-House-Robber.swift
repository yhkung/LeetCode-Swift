/// 198. House Robber
/// - Approach: Iterative Bottom-Up + memo
/// - Space Complexity: O(n)
/// - Time Complexity: O(n)
class Solution {
    func rob(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }
        if nums.count == 1 {
            return nums[0]
        }
        if nums.count == 2 {
            return max(nums[0], nums[1])
        }

        var dp: [Int] = [
            nums[0],
            max(nums[0], nums[1])
        ]
        for n in 2..<nums.count {
            dp.append(max(nums[n] + dp[n - 2], dp[n - 1]))
        }
        return dp.last!
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