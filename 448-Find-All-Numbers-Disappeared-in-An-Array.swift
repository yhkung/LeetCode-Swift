/// 448 - Find All Numbers Disappeared in an Array
/// - Approach: Cyclic sort
/// - Time Complexity: O(n)
/// - Space Complexity: O(1)
class Solution {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        var nums: [Int] = nums
        var missed: [Int] = []
        var i = 0
        var n = nums.count
        while i < n {
            let j = nums[i] - 1
            if j < n && nums[i] != nums[j] {
                var tmp = nums[i]
                nums[i] = nums[j]
                nums[j] = tmp
            } else {
                i += 1
            }
        }
        for (i, n) in nums.enumerated() {
            if n != (i + 1) {
                missed .append(i + 1)
            }
        }
        return missed
    }
}