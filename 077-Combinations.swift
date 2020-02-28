/// 077 - Combinations
/// - Link: https://leetcode.com/problems/combinations/
/// - Approach: Backtracking
class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var results: [[Int]] = []
        var candidates: [Int] = []
        backtracking(&results, k, n, &candidates, 0)
        return results
    }

    private func backtracking(_ results: inout [[Int]], _ k: Int, _ n: Int, _ candidates: inout [Int], _ index: Int) {
        if candidates.count == k {
            results.append(candidates)
            return
        }
        for i in index..<n {
            candidates.append(i + 1)
            backtracking(&results, k, n, &candidates, i + 1)
            candidates.removeLast()
        }
    }
}