/// 031 - Next Permutation
/// - Link: https://leetcode.com/problems/next-permutation/
/// - Approach: Single pass
/// - Time Complexity: O(n)
/// - Space Complexity: O(1)
class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        var i = nums.count - 2

        /// 1. Finding first decreasing number index
        while i >= 0 && nums[i + 1] <= nums[i] {
            i -= 1
        }

        /// 2. Finding number that just larger than the decreasing number and swap them
        if i >= 0 {
            var j = nums.count - 1
            while j >= 0 && nums[j] <= nums[i] {
                j -= 1
            }
            (nums[i], nums[j]) = (nums[j], nums[i])
        }

        /// 3. Reverse the elements after the decreasing number
        var start = i + 1
        var end = nums.count - 1
        while start < end {
            (nums[start], nums[end]) = (nums[end], nums[start])
            start += 1
            end -= 1
        }
    }
}