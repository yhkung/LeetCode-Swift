/// 1370 - Increasing Decreasing String
/// - Link: https://leetcode.com/problems/increasing-decreasing-string/
class Solution {
    func sortString(_ s: String) -> String {
        var result: [Character] = []
        var dict: [Character: Int] = s.reduce(into: [Character: Int](), { $0[$1, default: 0] += 1 })
        var sortedKeys = dict.keys.sorted()

        var reversed = false
        while result.count < s.count {
            sortedKeys = dict.keys.sorted()
            for i in 0..<dict.count {
                let c = sortedKeys[i]
                result.append(c)
                dict[c, default: 0] -= 1
                if dict[c, default: 0] <= 0 {
                    dict.removeValue(forKey: c)
                }
            }
            sortedKeys = dict.keys.sorted()
            for j in stride(from: dict.count - 1, through: 0, by: -1) {
                let c = sortedKeys[j]
                result.append(c)
                dict[c, default: 0] -= 1
                if dict[c, default: 0] <= 0 {
                    dict.removeValue(forKey: c)
                }
            }
        }
        return String(result)
    }
}