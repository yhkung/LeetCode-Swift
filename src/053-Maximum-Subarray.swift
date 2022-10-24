/// 053 - Maximum Subarray
/// - Link: https://leetcode.com/problems/maximum-subarray/
/// - Time: O(n)
/// - Space: O(1)
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var cur = 0
        var maximum = Int.min
        for n in nums {
            cur = max(n, cur + n)
            maximum = max(maximum, cur)
        }
        return maximum
    }
}

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        
        var dp = Array(repeating: 0, count: nums.count)
        dp[0] = nums[0]
        var maximum = dp[0]

        for i in 1..<nums.count {
            if dp[i - 1] > 0 {
                dp[i] = dp[i - 1] + nums[i]
            } else {
                dp[i] = nums[i]
            }            
            maximum = max(maximum, dp[i])
        }

        return maximum
    }
}

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        
        var curr = nums[0]
        var maximum = curr

        for i in 1..<nums.count {
            if curr > 0 {
                curr += nums[i]
            } else {
                curr = nums[i]                
            }            
            maximum = max(maximum, curr)
        }

        return maximum
    }
}