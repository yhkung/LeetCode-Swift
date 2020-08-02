/// 283 - Move Zeroes
/// - Link: https://leetcode.com/problems/move-zeroes/
/// - Time: O(n)
/// - Space: O(1)
class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        guard !nums.isEmpty else { return }
        var j = 0
        for i in 0..<nums.count {
            if nums[i] == 0 {
                continue
            }
            (nums[i], nums[j]) = (nums[j], nums[i])
            j += 1
        }
    }
}