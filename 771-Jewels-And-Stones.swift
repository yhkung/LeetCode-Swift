/// 771 - Jewels and Stones
/// - Link: https://leetcode.com/problems/jewels-and-stones/
/// - Time: O(m + n)
/// - Space: O(m)
class Solution {
    func numJewelsInStones(_ J: String, _ S: String) -> Int {
        var s = S.reduce(into: [Character: Int]()) { $0[$1, default: 0] += 1 }
        var count = 0
        for c in J {
            count += s[c, default: 0]
        }
        return count
    }
}