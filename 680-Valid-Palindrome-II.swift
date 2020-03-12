/// 680 - Valid Palindrome II
/// - Link: https://leetcode.com/problems/valid-palindrome-ii/
/// - Approach: Two Pointers
class Solution {
    func validPalindrome(_ s: String) -> Bool {
        let s = Array(s)
        var i = 0
        var j = s.count - 1
        while i < j {
            if s[i] != s[j] {
                return validPalindrome(s, i + 1, j) || validPalindrome(s, i, j - 1)
            }
            i += 1
            j -= 1
        }
        return true
    }

    func validPalindrome(_ s: [Character], _ i: Int, _ j: Int) -> Bool {
        var i = i
        var j = j
        while i < j {
            if s[i] != s[j] {
                return false
            }
            i += 1
            j -= 1
        }
        return true
    }
}