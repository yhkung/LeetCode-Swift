// Time: O(n), Space: O(n)
class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        var numSet = Set(nums)
        var longest = 0

        for n in nums {
            if numSet.contains(n - 1) {
                continue
            }
            var length = 0
            while numSet.contains(n + length) {
                length += 1
                longest = max(longest, length)
            }
        }

        return longest
    }
}