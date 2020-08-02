/// 383 - Ransom Note
/// - Link: https://leetcode.com/problems/ransom-note/
/// - Time: O(m)
class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var dict = magazine.reduce(into: [Character: Int]()) { $0[$1, default: 0] += 1 }
        for c in ransomNote {
            if dict[c] == nil {
                return false
            }
            if let value = dict[c], value > 0 {
                dict[c, default: 0] -= 1
            } else {
                return false
            }
        }
        return true
    }
}