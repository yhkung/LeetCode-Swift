/// 078 - Subsets
/// - Link: https://leetcode.com/problems/subsets/
/// - Approach: Backtracking
class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var res: Set<[Int]> = Set()
        var candidates: [Int] = []
        subsets(nums, 0, &candidates, &res)
        return Array(res)
    }

    private func subsets(_ nums: [Int], _ index: Int, _ candidates: inout [Int], _ results: inout Set<[Int]>) {
        results.insert(candidates)
        for i in index..<nums.count {
            candidates.append(nums[i])
            subsets(nums, i + 1, &candidates, &results)
            candidates.removeLast()
        }
    }
}