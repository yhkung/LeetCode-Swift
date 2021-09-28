/// 213. House Robber II
/// https://leetcode.com/problems/house-robber-ii/
/// Time Complexity: O(n)
/// Space Complexity: O(1)
class Solution {
    func rob(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return nums[0]
        }
        if nums.count == 2 {
            return max(nums[0], nums[1])
        }

        let robStartFromFirst = rob(nums, 0, nums.count - 1)
        let robStartFromSecond = rob(nums, 1, nums.count)
        return max(robStartFromFirst, robStartFromSecond)
    }

    private func rob(_ nums: [Int], _ from: Int, _ to: Int) -> Int {
        var prev = 0
        var curr = 0
        for i in from..<to {
            let tmp = curr
            curr = max(curr, prev + nums[i])
            prev = tmp
        }
        return curr
    }
}