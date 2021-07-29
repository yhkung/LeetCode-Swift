/// 611. Valid Triangle Number
/// https://leetcode.com/problems/valid-triangle-number/
/// Approach: Two Pointer, Sorting
/// Time Completixy: O(n^2)
/// Space Completixy: O(n)
class Solution {
    func triangleNumber(_ nums: [Int]) -> Int {
        guard nums.count >= 3 else {
            return 0
        }
        let nums = nums.sorted()

        var count = 0
        for i in (2..<nums.count).reversed() {
            var left = 0
            var right = i - 1

            while left < right {
                let sum = nums[left] + nums[right]
                if sum > nums[i] {
                    count += right - left
                    right -= 1
                } else {
                    left += 1
                }
            }
        }

        return count
    }
}