/// 394. Decode String
///
/// Time Complexity: O(n)
/// Space Complexity: O(n)
class Solution {
    func decodeString(_ s: String) -> String {
        var stack: [String] = []
        var curStr = ""
        var curNum = 00
        for c in s {
            if c == "[" {
                stack.append(curStr)
                stack.append(String(curNum))
                curStr = ""
                curNum = 0
            } else if c == "]" {
                let num = Int(stack.popLast()!)!
                let prevStr = stack.popLast()!
                var tmp = ""
                for _ in 1...num {
                    tmp += curStr
                }
                curStr = prevStr + tmp
            } else if let n = Int(String(c)) {
                curNum = curNum * 10 + n
            } else {
                curStr += String(c)
            }
        }
        return curStr
    }
}