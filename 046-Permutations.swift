/// 046 - Permutations
/// - Link: https://leetcode.com/problems/permutations/
/// - Approach: Backtracking, Recursion
class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var results: [[Int]] = []
        permutate(nums, [], 0, &results)
        return results
    }

    func permutate(_ nums: [Int], _ permutations: [Int], _ index: Int, _ results: inout [[Int]]) {
        if index == nums.count {
            results.append(permutations)
            return
        }
        for i in 0..<nums.count {
            let n = nums[i]
            if !permutations.contains(n) {
                permutate(nums, permutations + [n], index + 1, &results)
            }
        }
    }
}

/// Stack
class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var results: [[Int]] = []
        var stack: [([Int], Int)] = [([], 0)]
        while !stack.isEmpty {
            let cur = stack.removeLast()
            let permutation = cur.0
            let index = cur.1

            if index == nums.count {
                results.append(permutation)
                continue
            }

            for i in 0..<nums.count {
                let n = nums[i]
                if !permutation.contains(n) {
                    stack.append((permutation + [n], index + 1))
                }
            }
        }
        return results
    }
}