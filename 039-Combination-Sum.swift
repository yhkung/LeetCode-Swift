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
        var results: [[Int]] = []
        var combination: [Int] = []
        backtracking(&results, &combination, candidates.sorted(), target, 0)
        return results
    }

    private func backtracking(_ results: inout [[Int]], _ combination: inout [Int], _ nums: [Int], _ remain: Int, _ index: Int) {
        if remain < 0 {
            return
        } else if remain == 0 {
            results.append(combination)
        } else {
             for i in index..<nums.count {
                combination.append(nums[i])
                backtracking(&results, &combination, nums, remain - nums[i], i)
                combination.removeLast()
            }
        }
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