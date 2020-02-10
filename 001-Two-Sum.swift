/// 001 - Two Sum
/// - Approach: Hash Table
/// - Time Complexity: O(n)
/// - Space Complexity: O(n)
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict: [Int: Int] = [] /// [Number: Index of Number]
        for (i, n) in nums.enumerated() {
            if let index = dict[target - n] {
                return [index, i]
            }
            dict[n] = i
        }
        return []
    }
}