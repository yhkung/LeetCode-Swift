/// 159. Longest Substring with At Most Two Distinct Characters
/// https://leetcode.com/problems/longest-substring-with-at-most-two-distinct-characters/
/// - Approach: Sliding Window
/// - Time Complexity: O(n)
/// - Space Complexity: O(1)
class Solution {
    func lengthOfLongestSubstringTwoDistinct(_ s: String) -> Int {
        guard s.count > 2 else { return s.count }
        let s = Array(s)
        var maximumLength = 0
        var left = 0
        var right = 0
        var map = [Character: Int]()
        while right < s.count {
            if map.count < 3 {
                map[s[right]] = right
                right += 1
            }
            if map.count == 3 {
                let leftIndex = map.values.min()!
                let charToBeRemoved = s[leftIndex]
                map[charToBeRemoved] = nil
                left = leftIndex + 1
            }
            maximumLength = max(maximumLength, right - left)
        }
        return maximumLength
    }
}