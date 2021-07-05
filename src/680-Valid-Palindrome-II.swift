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

class Solution {
    func validPalindrome(_ s: String) -> Bool {
        guard !s.isEmpty else {
            return false
        }

        let s = Array(s)
        let pair = findDifference(0, s.count - 1, s)

        if pair.left >= pair.right {
            return true
        }

        return isPalindrome(pair.left + 1, pair.right, s) || isPalindrome(pair.left, pair.right - 1, s)
    }

    private func isPalindrome(_ left: Int, _ right: Int, _ s: [Character]) -> Bool {
        guard !s.isEmpty else {
            return false
        }

        let pair = findDifference(left, right, s)

        return pair.left >= pair.right
    }

    private func findDifference(_ left: Int, _ right: Int, _ s: [Character]) -> (left: Int, right: Int) {
        var left = left
        var right = right

        while left < right {
            if s[left] != s[right] {
                break
            }
            left += 1
            right -= 1
        }

        return (left, right)
    }
}