/// 003. Longest Substring Without Repeating Characters
/// - Approach: Sliding Window
/// - Time Complexity: O(n)
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard !s.isEmpty else { return s.count }
        let s = Array(s)
        var start = 0
        var end = 0
        var length = 0
        var map: [Character: Int] = [:]
        while end < s.count {
            map[s[end], default: 0] += 1
            end += 1
            if map.count <= length {
                map[s[start]]! -= 1
                if map[s[start]] == 0 {
                    map.removeValue(forKey: s[start])
                }
                start += 1
            }
            length = max(length, end - start)
        }
        return length
    }
}