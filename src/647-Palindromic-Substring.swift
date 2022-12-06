class Solution {
    func countSubstrings(_ s: String) -> Int {
        let s = Array(s)
        
        var result = 0

        for i in 0..<s.count {
            result += countPalindrome(i, i, s)
            result += countPalindrome(i, i + 1, s)
        }

        return result
    }

    private func countPalindrome(_ left: Int, _ right: Int, _ s: [Character]) -> Int {
        var left = left
        var right = right
        var result = 0
        while left >= 0 && right < s.count && s[left] == s[right] {
            result += 1
            left -= 1
            right += 1
        }
        return result
    }
}