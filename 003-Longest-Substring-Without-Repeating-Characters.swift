class Solution {
    
    /// Time complexity : O(n)
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard s.count > 1 else { return s.count }
        
        let chars = s.map { String($0) }
        var map = [String: Int]()
        var maxLength = 1
        var startIndex = 0
        
        for i in 0..<chars.count {
            if let prevIndex = map[chars[i]], (i - startIndex) <= maxLength {
                startIndex = max(startIndex, prevIndex + 1)
            }
            maxLength = max(maxLength, i - startIndex + 1)
            map[chars[i]] = i
        }
        
        return maxLength
    }
    
}