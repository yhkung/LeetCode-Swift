/// 678 - Valid Parenthsis String
/// - Link: https://leetcode.com/problems/valid-parenthesis-string
/// - Time: O(n)
/// - Space: O(1)
class Solution {
    func checkValidString(_ s: String) -> Bool {
        var s = Array(s)
        var leftBalance = 0
        for c in s {
            if c == "(" || c == "*" {
                leftBalance += 1
            } else {
                leftBalance -= 1
            }
            if leftBalance < 0 {
                return false
            }
        }

        var rightBalance = 0
        for c in s.reversed() {
            if c == ")" || c == "*" {
                rightBalance += 1
            } else {
                rightBalance -= 1
            }
            if rightBalance < 0 {
                return false
            }
        }
        return true
    }
}