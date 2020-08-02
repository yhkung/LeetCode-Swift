/// 041 - First Missing Number
/// - Approach: Cyclic Sort
/// - Time Complexity: O(n)
/// - Space Complexity: O(n)
class Solution {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        var nums = nums
        var i = 0
        while i < nums.count {
            let j = nums[i] - 1
            if j >= 0 && j < nums.count && nums[i] != nums[j] {
                var tmp = nums[i]
                nums[i] = nums[j]
                nums[j] = tmp
            } else {
                i += 1
            }
        }

        for (i, n) in nums.enumerated() {
            if n != i + 1 {
                return i + 1
            }
        }
        return nums.count + 1
    }
}