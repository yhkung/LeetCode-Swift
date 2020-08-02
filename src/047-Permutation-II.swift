/// 047 - Permutations II
/// - Link: https://leetcode.com/problems/permutations-ii/
/// - Approach: Backtracking, Recursion
class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var results: [[Int]] = []
        var used: [Bool] = Array(repeating: false, count: nums.count)
        var permutation: [Int] = []
        backtracking(nums.sorted(), &used, &permutation, &results)
        return results
    }

    private func backtracking(_ nums: [Int], _ used: inout [Bool], _ permutation: inout [Int], _ results: inout [[Int]]) {
        if permutation.count == nums.count {
            results.append(permutation)
            return
        }
        for i in 0..<nums.count {
            if used[i] || (i > 0 && nums[i] == nums[i - 1] && !used[i - 1]) {
                continue
            }
            used[i] = true
            permutation.append(nums[i])
            backtracking(nums, &used, &permutation, &results)
            used[i] = false
            permutation.removeLast()
        }
    }
}

/// Stack
class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var nums = nums.sorted()
        var results: [[Int]] = []
        var stack: [([Bool], [Int])] = [(Array(repeating: false, count: nums.count), [])]
        while !stack.isEmpty {
            let cur = stack.removeFirst()
            let visited = cur.0
            let candidates = cur.1
            if candidates.count == nums.count {
                results.append(candidates)
                continue
            }
            for i in 0..<nums.count {
                if visited[i] {
                    continue
                }
                if i > 0 && !visited[i - 1] && nums[i] == nums[i - 1] {
                    continue
                }
                var newVisited = visited
                newVisited[i] = true
                stack.append((newVisited, candidates + [nums[i]]))
            }
        }
        return results
    }
}