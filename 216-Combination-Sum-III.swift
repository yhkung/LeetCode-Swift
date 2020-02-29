/// 216 - Combination Sum III
/// - Link: https://leetcode.com/problems/combination-sum-iii/
/// - Approach: Backtracking
class Solution {
    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        var results: [[Int]] = []
        var combination: [Int] = []
        backtracking(&results, 1, &combination, k, n)
        return results
    }

    private func backtracking(_ results: inout [[Int]], _ index: Int, _ combination: inout [Int], _ k: Int, _ remainingSum: Int) {
        if combination.count == k {
            if remainingSum == 0 {
                results.append(combination)
            }
            return
        }
        if index > 9 {
            return
        }
        for i in index...9 {
            combination.append(i)
            backtracking(&results, i + 1, &combination, k, remainingSum - i)
            combination.removeLast()
        }
    }
}

/// - Approach: Backtracking iteration
class Solution {
    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        var results: [[Int]] = []
        var combination: [Int] = []

        var stack: [([Int], Int, Int)] = [([], 1, n)]

        while !stack.isEmpty {
            let cur = stack.removeFirst()
            let combination = cur.0
            let index = cur.1
            let remainingSum = cur.2
            if combination.count == k {
                if remainingSum == 0 {
                    results.append(combination)
                }
                continue
            }

            if index > 9 {
                continue
            }

            for i in index...9 {
                let next = (combination + [i], i + 1, remainingSum - i)
                stack.insert(next, at: 0)
            }
        }
        return results
    }
}