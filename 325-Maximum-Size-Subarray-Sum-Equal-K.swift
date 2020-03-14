/// 325. Maximum Size Subarray Sum Equals k
/// - Link: https://leetcode.com/problems/maximum-size-subarray-sum-equals-k/
/// - Approach: Hash Table
/// - Time Complexity: O(n)
class Solution {
    func maxSubArrayLen(_ nums: [Int], _ k: Int) -> Int {
        var sum = 0
        var len = 0
        var dict: [Int: Int] = [0: -1]
        for i in 0..<nums.count {
            sum += nums[i]
            if sum == k {
                len = max(len, i + 1)
            } else if let prevIndex = dict[sum - k] {
                len = max(len, i - prevIndex)
            }
            if dict[sum] == nil {
                dict[sum] = i
            }
        }
        return len
    }
}