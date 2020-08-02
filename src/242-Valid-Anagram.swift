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

class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }
        var dict = t.reduce(into: [Character: Int]()) { $0[$1, default: 0] += 1 }
        var counter = t.count
        for c in s {
            if let count = dict[c], count > 0 {
                dict[c, default: 0] -= 1
                counter -= 1
            }
        }
        return counter == 0
    }
}