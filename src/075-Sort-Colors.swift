class Solution {
    func sortColors(_ nums: inout [Int]) {
        var left = 0
        var right = nums.count - 1
        var i = 0

        while i <= right {
            if nums[i] == 0 {
                (nums[i], nums[left]) = (nums[left], nums[i])
                left += 1
                i += 1
            } else if nums[i] == 2 {
                (nums[i], nums[right]) = (nums[right], nums[i])
                right -= 1
            } else {
                i += 1
            }
        }
    }
}