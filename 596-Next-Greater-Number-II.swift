/// 596. Next Greater Element II
/// Approach #1 - Brute Force
/// - Time Complexity: O(n^2)
/// - Space Complexity: O(n)
class Solution {
    func nextGreaterElements(_ nums: [Int]) -> [Int] {
        var res = Array(repeating: -1, count: nums.count)
        for (i, num) in nums.enumerated() {
            var j = i + 1
            if j == nums.count {
                j = 0
            }
            while true {
                if j == nums.count {
                    j = 0
                }
                guard j != i else { break }
                if nums[j] > nums[i] {
                    res[i] = nums[j]
                    break
                }
                j += 1
            }
        }
        return res
    }
}