/// 046 - Permutations
/// - Link: https://leetcode.com/problems/permutations/
/// - Approach: Backtracking, Recursion
class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var results: [[Int]] = []
        permutate(nums, [], &results)
        return results
    }

    func permutate(_ nums: [Int], _ permutations: [Int], _ results: inout [[Int]]) {
        if permutations.count == nums.count {
            results.append(permutations)
            return
        }
        for i in 0..<nums.count {
            let n = nums[i]
            if !permutations.contains(n) {
                permutate(nums, permutations + [n], &results)
            }
        }
    }
}

/// Stack
class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var results: [[Int]] = []
        var stack: [[Int]] = [[]]
        while !stack.isEmpty {
            let cur = stack.removeLast()
            if cur.count == nums.count {
                results.append(cur)
                continue
            }
            for n in nums {
                if !cur.contains(n) {
                    stack.append(cur + [n])
                }
            }
        }
        return results
    }
}