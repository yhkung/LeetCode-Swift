/// https://leetcode.com/problems/missing-number/
/// 268 - Missing Number
/// Approacha: Mathematics
/// Time Complexity: O(n)
/// Space Complexity: O(1)
class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        let expectedSum = ((1 + nums.count) * nums.count / 2)
        var actualSum = nums.reduce(0) { $0 + $1 }
        return expectedSum - actualSum
    }
}