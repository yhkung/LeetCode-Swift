/// 14. Longest Common Prefix
class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard !strs.isEmpty else { return "" }
        var pre = strs.min { $0.count < $1.count }!
        for str in strs {
            while !str.hasPrefix(pre), !pre.isEmpty {
                pre.removeLast()
            }
        }
        return pre
    }
}