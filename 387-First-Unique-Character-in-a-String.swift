/// 387 - First Unique Character in a String
/// - Link: https://leetcode.com/problems/first-unique-character-in-a-string/
/// - Time: O(n)
/// - Space: O(n)
class Solution {
    func firstUniqChar(_ s: String) -> Int {
        let s = Array(s)
        var dict = s.reduce(into: [Character: Int]()) { $0[$1, default: 0] += 1 }
        for (i, c) in s.enumerated() {
            if let count = dict[c], count == 1 {
                return i
            }
        }
        return -1
    }
}