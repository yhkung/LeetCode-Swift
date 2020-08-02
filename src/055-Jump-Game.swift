/// 055 - Jump Game
/// - Link: https://leetcode.com/problems/jump-game/
/// - Time: O(n)
/// - Space: O(1)
class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        guard nums.count > 1 else {
            return true
        }
        var curIndex = nums.count - 1
        for i in (0...nums.count - 1).reversed() {
            if nums[i] >= curIndex - i {
                curIndex = i
            }
        }
        return curIndex == 0
    }
}