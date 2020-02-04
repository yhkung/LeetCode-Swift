/// 242 - Valid Anagram
/// - Approach: Hash Table
/// - Time Complexity: O(m+n)
/// - Space Complexity: O(1)
class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        return s.reduce([Character: Int]()) { $0[$1, default: 0] += 1 } ==
               t.reduce([Character: Int]()) { $0[$1, default: 0] += 1 }
    }
}