/// 090 - Subsets II
/// - Link: https://leetcode.com/problems/subsets-ii/
/// - Approach: Backtracking
class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var res: [[Int]] = []
        var candidates: [Int] = []
        backtracking(nums.sorted(), 0, &candidates, &res)
        return res
    }

    private func backtracking(_ nums: [Int], _ start: Int, _ candidates: inout [Int], _ results: inout [[Int]]) {
        results.append(candidates)
        for i in start..<nums.count {
            if i > start && nums[i] == nums[i - 1] { continue }
            candidates.append(nums[i])
            backtracking(nums, i + 1, &candidates, &results)
            candidates.removeLast()
        }
    }
}