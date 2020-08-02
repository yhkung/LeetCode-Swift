/// 1047 - Remove All Adjacent Duplicates In String
/// - Link: https://leetcode.com/problems/remove-all-adjacent-duplicates-in-string/
/// - Approach: Replace
/// - Time Complexity: O(n^2)
class Solution {
    func removeDuplicates(_ S: String) -> String {
        guard S.count > 1 else { return S }
        var s = Array(S)
        var i = 0
        while i < s.count - 1 {
            if s[i] == s[i + 1] {
                s.removeSubrange(i...i+1)
                i = i > 0 ? i - 1 : 0
            } else {
                i += 1
            }
        }
        return String(s)
    }
}

/// 1047 - Remove All Adjacent Duplicates In String
/// - Link: https://leetcode.com/problems/remove-all-adjacent-duplicates-in-string/
/// - Approach: Stack
/// - Time Complexity: O(n)
class Solution {
    func removeDuplicates(_ S: String) -> String {
        guard S.count > 1 else { return S }
        var stack: [Character] = []
        for c in S {
            if let top = stack.last, c == top {
                stack.removeLast()
            } else {
                stack.append(c)
            }
        }
        return String(stack)
    }
}