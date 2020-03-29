/// 494 - Target Sum
/// - Link: https://leetcode.com/problems/target-sum/
class Solution {
    func findTargetSumWays(_ nums: [Int], _ S: Int) -> Int {
        var memo: [String: Int] = [:]
        return recursion(nums, S, 0, 0, &memo)
    }

    func recursion(_ nums: [Int], _ S: Int, _ index: Int, _ sum: Int, _ memo: inout [String: Int]) -> Int {
        let key = "\(index)-\(sum)"
        if let count = memo[key] {
            return count
        }
        if index == nums.count {
            if sum == S {
                return 1
            } else {
                return 0
            }
        }

        let add = recursion(nums, S, index + 1, sum + nums[index], &memo)
        let substract = recursion(nums, S, index + 1, sum - nums[index], &memo)
        let result = add + substract
        memo[key] = result
        return result
    }
}