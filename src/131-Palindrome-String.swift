/// 131 - Palindrome Partitioning
/// - Link: https://leetcode.com/problems/palindrome-partitioning/
/// - Approach: Backgtracking
class Solution {
    func partition(_ s: String) -> [[String]] {
        var results: [[String]] = []
        var candidates: [String] = []
        backtracking(Array(s), &candidates, 0, &results)
        return results
    }

    private func backtracking(_ s: [Character], _ candidates: inout [String], _ start: Int, _ results: inout [[String]]) {
        if start == s.count {
            results.append(candidates)
            return
        }
        for i in start..<s.count {
            let str = String(s[start...i])
            if !str.isPalindrome { continue }

            candidates.append(str)
            backtracking(s, &candidates, i + 1, &results)
            candidates.removeLast()
        }
    }
}
extension String {
    var isPalindrome: Bool {
        return self == String(self.reversed())
    }
}