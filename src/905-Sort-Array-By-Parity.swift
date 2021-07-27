/// 905. Sort Array By Parity
/// https://leetcode.com/problems/sort-array-by-parity/
/// Approach: Two pointer
/// Time Complexity: O(n)
class Solution {
    func sortArrayByParity(_ nums: [Int]) -> [Int] {
        guard !nums.isEmpty else {
            return nums
        }
        var nums = nums
        var left = 0
        var right = nums.count - 1

        while left <= right {
            while left <= right && nums[left] % 2 == 0 {
                left += 1
            }
            while left <= right && nums[right] % 2 == 1 {
                right -= 1
            }

            if left <= right {
                nums.swapAt(left, right)
                left += 1
                right -= 1
            }
        }

        return nums
    }
}