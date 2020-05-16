/// 918 - Maximum Sum Circular Subarray
/// - Link: https://leetcode.com/problems/maximum-sum-circular-subarray/
/// - Time: O(n)
/// - Space: O(1)
class Solution {
    func maxSubarraySumCircular(_ A: [Int]) -> Int {
        var maxSum = -Int.max
        var curMax = 0
        var minSum = Int.max
        var curMin = 0
        var total = 0
        for num in A {
            curMax = max(curMax + num, num)
            maxSum = max(curMax, maxSum)
            curMin = min(curMin + num, num)
            minSum = min(minSum, curMin)
            total += num
        }
        return maxSum > 0 ? max(maxSum, total - minSum) : maxSum
    }
}