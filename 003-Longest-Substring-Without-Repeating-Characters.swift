/// 003. Longest Substring Without Repeating Characters
/// Approach - Sliding Window
/// - Time complexity : O(n)
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard s.count > 1 else { return s.count }
        var map = [Character: Int]()
        var maxLength = 1
        var startIndex = 0
        for (i, c) in s.enumerated() {
            if let prevIndex = map[c], (i - startIndex) <= maxLength {
                startIndex = max(startIndex, prevIndex + 1)
            }
            maxLength = max(maxLength, i - startIndex + 1)
            map[c] = i
        }
        return maxLength
    }
}