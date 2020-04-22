/// 560 - Subarray Sum Equals K
/// - Link: https://leetcode.com/problems/subarray-sum-equals-k/
/// - Time: O(n)
/// - Space: O(n)
class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var dict: [Int: Int] = [0: 1]
        var sum = 0
        var count = 0

        for n in nums {
            sum += n
            let target = sum - k
            count += dict[target] ?? 0
            dict[sum, default: 0] += 1
        }

        return count
    }
}