/// 039 - Combination Sum
/// - Link: https://leetcode.com/problems/combination-sum/
/// - Approach: BFS
class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        /// (Remaining Sum, Combinations, Candidates-Index)
        var queue: [(Int, [Int], Int)] = []
        var visited: Set<[Int]> = []

        queue.append((0, [], 0))

        var results: [[Int]] = []
        while !queue.isEmpty {
            let cur = queue.removeFirst()
            let num = cur.0
            var combinations = cur.1
            let index = cur.2
            for i in index..<candidates.count {
                let c = candidates[i]
                let sum = num + c
                let com = (combinations + [c])
                if sum == target && !results.contains(com) {
                    results.append(com)
                } else if sum < target {
                    if !visited.contains(com) {
                        queue.append((sum, com, i))
                        visited.insert(com)
                    }
                }
            }
        }
        return results
    }
}

/// 039 - Combination Sum
/// - Link: https://leetcode.com/problems/combination-sum/
/// - Approach: Recursion
class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        return dfs(candidates, target, [], 0, [])
    }

    func dfs(_ nums: [Int], _ remainingSum: Int, _ result: [Int], _ index: Int, _ results: [[Int]]) -> [[Int]] {
        guard remainingSum > 0 else { return results }
        var results = results
        for i in index..<nums.count {
            let num = nums[i]
            let res = result + [num]
            if num == remainingSum {
                results.append(res)
            } else {
                results = dfs(nums, remainingSum - num, res, i, results)
            }
        }
        return results
    }
}

/// 039 - Combination Sum
/// - Link: https://leetcode.com/problems/combination-sum/
/// - Approach: Recursion
class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var results: [[Int]] = []
        var stack: [(Int, [Int], Int)] = []
        stack.append((target, [], 0))

        while !stack.isEmpty {
            let cur = stack.removeLast()
            let remainingSum = cur.0
            let combination = cur.1
            let index = cur.2

            for i in index..<candidates.count {
                let num = candidates[i]
                if num == remainingSum {
                    results.append(combination + [num])
                } else if remainingSum >= num {
                    stack.append((remainingSum - num, combination + [num], i))
                }
            }
        }
        return results
    }
}