/// 209 - Minimum Size Subarray Sum
/// - Link: https://leetcode.com/problems/minimum-size-subarray-sum/
/// - Approach: Sliding Window
class Solution {
    func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
        var res = Int.max
        var sum = 0
        var start = 0
        var end = 0
        while end < nums.count {
            sum += nums[end]
            while sum >= s {
                res = min(res, end - start + 1)
                sum -= nums[start]
                start += 1
            }
            end += 1
        }
        return res == Int.max ? 0 : res
    }
}