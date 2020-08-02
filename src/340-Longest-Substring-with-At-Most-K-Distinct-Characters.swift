/// 340 - Longest Substring with At Most K Distinct Characters
/// - Link: https://leetcode.com/problems/longest-substring-with-at-most-k-distinct-characters/
/// - Approach: Sliding Window
/// - Time Complexity: O(n)
/// - Space Complexity: O(k), used only for a hashmap with at most k + 1 elements
class Solution {
    func lengthOfLongestSubstringKDistinct(_ s: String, _ k: Int) -> Int {
        let s = Array(s)
        var start = 0
        var end = 0
        var map: [Character: Int] = [:]
        var maximumLength = 0
        while end < s.count {
            map[s[end], default: 0] += 1
            end += 1

            if map.count > k {
                map[s[start], default: 0] -= 1
                if map[s[start], default: 0] <= 0 {
                    map.removeValue(forKey: s[start])
                }
                start += 1
            }
            maximumLength = max(maximumLength, end - start)
        }
        return maximumLength
    }
}