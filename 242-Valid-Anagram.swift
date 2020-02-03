/// 242 - Valid Anagram
/// - Approach: Hash Table
/// - Time Complexity: O(m+n)
/// - Space Complexity: O(1)
class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        var sDict: [Character: Int] = [:]
        var tDict: [Character: Int] = [:]
        s.forEach { sDict[$0, default: 0] += 1 }
        t.forEach { tDict[$0, default: 0] += 1 }
        return sDict == tDict
    }
}