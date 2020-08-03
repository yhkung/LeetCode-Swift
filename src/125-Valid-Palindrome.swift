/// 125. Valid Palindrome
/// Time Complexity: O(n)
extension Character {
    var isLetterOrNumber: Bool {
        return isLetter || isNumber
    }
}

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let s = Array(s)
        var i = 0
        var j = s.count - 1

        while i < j {
            while i < j && !s[i].isLetterOrNumber {
                i += 1
            }
            while i < j && !s[j].isLetterOrNumber {
                j -= 1
            }

            if s[i].lowercased() != s[j].lowercased() {
                return false
            }
            i += 1
            j -= 1
        }
        return true
    }
}
