/// 027 - Remove Elements
/// - Link: https://leetcode.com/problems/remove-element/
/// - Time: O(n)
/// - Space: O(1)
class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var j = 0
        for i in 0..<nums.count {
            if nums[i] == val { continue }
            (nums[i], nums[j]) = (nums[j], nums[i])
            j += 1
        }
        nums.removeLast(nums.count - j)
        return nums.count
    }
}

class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        nums.removeAll { $0 == val }
        return nums.count
    }
}