/// 5. Longest Palindromic Substring
/// - Approach: Dynamic Programming
/// - Time Complexity: O(n^2)
class Solution {
    func longestPalindrome(_ s: String) -> String {
        guard !s.isEmpty else { return "" }        
        
        let n = s.count
        let s = Array(s)
        
        var longest: (start: Int, end: Int) = (0, 0)        
        
        var isPalindrome = Array(repeating: Array(repeating: false, count: n), count: n)
        
        for i in 0..<n {
            isPalindrome[i][i] = true
            longest = (i, i)
        }
        
        for i in 0..<n - 1 {
            isPalindrome[i][i + 1] = s[i] == s[i + 1]
            
            if isPalindrome[i][i + 1] {
                longest = (i, i + 1)
            }            
        }    
                
        for i in (0..<n - 1).reversed() {
            for j in (i + 2..<n) {
                isPalindrome[i][j] = isPalindrome[i + 1][j - 1] && s[i] == s[j]                        
                
                if isPalindrome[i][j] && (j - i + 1 > longest.end - longest.start + 1) {
                    longest = (i, j)
                }                                
            }
        }
        
        return String(s[longest.start...longest.end])
    }
}