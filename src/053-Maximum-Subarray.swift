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