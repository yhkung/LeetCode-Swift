/// 525 - Contiguous Array
/// - Link: https://leetcode.com/problems/contiguous-array/
/// - Time: O(n)
/// - Space: O(n)
class Solution {
    func findMaxLength(_ nums: [Int]) -> Int {
        var dict = [Int: Int]() // key: sum, value: index
        dict[0] = -1
        var sum = 0
        var maxLength = 0
        for i in 0..<nums.count {
            sum += nums[i] == 0 ? -1 : 1
            if let index = dict[sum] {
                maxLength = max(maxLength, i - index)
            } else {
                dict[sum] = i
            }
        }
        return maxLength
    }
}