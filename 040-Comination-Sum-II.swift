/// 040 - Combination Sum II
/// - Link: https://leetcode.com/problems/combination-sum-ii/
/// - Approach: Recursion, Backtracking
class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        return combinationSum2(candidates.sorted(), target, [], 0, [])
    }

    private func combinationSum2(_ nums: [Int], _ target: Int, _ result: [Int], _ index: Int, _ results: [[Int]]) -> [[Int]] {
        var results = results
        if target < 0 {
            return results
        } else if target == 0 {
            results.append(result)
            return results
        }

        for i in index..<nums.count {
            if i > index && nums[i] == nums[i - 1] { continue }
            results = combinationSum2(nums, target - nums[i], result + [nums[i]], i + 1, results)
        }
        return results
    }
}

/// - Approach: Stack
class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var nums = candidates.sorted()
        var results: [[Int]] = []
        var stack: [(Int, [Int], Int)] = []
        stack.append((target, [], 0))

        while !stack.isEmpty {
            let cur = stack.removeLast()
            let remainingSum = cur.0
            let combination = cur.1
            let index = cur.2

            if remainingSum < 0 {
                continue
            } else if remainingSum == 0 {
                results.append(combination)
            } else {
                for i in index..<nums.count {
                    let num = nums[i]
                    let result = combination + [num]
                    if i > index && nums[i] == nums[i - 1] {
                        continue
                    } else {
                        stack.append((remainingSum - num, result, i + 1))
                    }
                }
            }
        }
        return results
    }
}