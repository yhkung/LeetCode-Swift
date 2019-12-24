/// 316. Remove Duplicate Letters
/// - Time Complexity: O(N)
/// - Space Complexity: O(1)
class Solution {
    func removeDuplicateLetters(_ s: String) -> String {
        var occ = [Character: Int]()
        var stack = [Character]()
        for (i, c) in s.enumerated() {
            occ[c] = i
        }
        for (i, c) in s.enumerated() {
            if !stack.contains(c) {
                while let last = stack.last, c < last, occ[last]! > i {
                    stack.popLast()
                }
                stack.append(c)
            }
        }
        return String(stack)
    }
}