/// 159. Longest Substring with At Most Two Distinct Characters
/// https://leetcode.com/problems/longest-substring-with-at-most-two-distinct-characters/
/// - Approach: Sliding Window
/// - Time Complexity: O(n)
/// - Space Complexity: O(1)
class Solution {
    func lengthOfLongestSubstringTwoDistinct(_ s: String) -> Int {
        guard s.count > 2 else { return s.count }
        var s = Array(s)
        var map: [Character: Int] = [:]
        var start = 0
        var end = 0
        var maximumLength = 0
        while end < s.count {
            map[s[end], default: 0] += 1
            end += 1
            while map.count > 2 {
                let c = s[start]
                map[c]! -= 1
                if map[c] == 0 {
                    map.removeValue(forKey: c)
                }
                start += 1
            }
            maximumLength = max(maximumLength, end - start)
        }
        return maximumLength
    }
}