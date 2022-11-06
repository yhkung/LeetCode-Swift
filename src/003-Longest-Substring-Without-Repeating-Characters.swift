/// 003. Longest Substring Without Repeating Characters
/// - Approach: Sliding Window
/// - Time Complexity: O(n), Space: O(n)
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let s = Array(s)
        var charSet = Set<Character>()
        var left = 0        
        var longest = 0
        
        for right in 0..<s.count {
            while charSet.contains(s[right]) {
                charSet.remove(s[left])
                left += 1
            }
            charSet.insert(s[right])
            longest = max(longest, right - left + 1)
        }

        return longest
    }
}