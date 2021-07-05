/// 125. Valid Palindrome
/// Time Complexity: O(n)
class Solution {
    func isPalindrome(_ s: String) -> Bool {
        guard !s.isEmpty else {
            return false
        }

        let s = Array(s)
        var left = 0
        var right = s.count - 1

        while left < right {
            while left < right && !isValid(s[left]) {
                left += 1
            }
            while left < right && !isValid(s[right]) {
                right -= 1
            }

            if s[left].lowercased() != s[right].lowercased() {
                return false
            }

            left += 1
            right -= 1
        }

        return true
    }

    private func isValid(_ c: Character) -> Bool {
        return c.isLetter || c.isNumber
    }
}
