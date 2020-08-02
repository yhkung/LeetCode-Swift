/// 1365 - How Many Numbers Are Smaller Than the Current Number
/// - Link: https://leetcode.com/problems/how-many-numbers-are-smaller-than-the-current-number/
/// - Approach: Sorted + HashTable
/// - Time Complexity: O(nlog)
/// - Space Complexity: O(n)
class Solution {
    func smallerNumbersThanCurrent(_ nums: [Int]) -> [Int] {
        var dict: [Int: Int] = [:]
        for (i, num) in nums.sorted().enumerated() {
            guard dict[num] == nil else { continue }
            dict[num] = i
        }
        return nums.map { dict[$0] ?? 0 }
    }
}