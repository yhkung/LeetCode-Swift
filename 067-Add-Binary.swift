/// 067 - Add Binary
/// - Link: https://leetcode.com/problems/add-binary
/// - Time Complexity: O(N + M)
/// - Space Complexity: O(max(N, M))
class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        var a = a.compactMap { Int("\($0)") }
        var b = b.compactMap { Int("\($0)") }

        var res = [Int]()
        var carry = 0

        while !a.isEmpty || !b.isEmpty || carry > 0 {
            var val1 = a.popLast() ?? 0
            var val2 = b.popLast() ?? 0
            let sum = val1 + val2 + carry

            carry = sum / 2
            res.append(sum % 2)
        }

        return res.reversed().map { String("\($0)") }.joined()
    }
}

/// - Time Complexity: O(max(N, M))
/// - Space Complexity: O(max(N, M))
class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        let len = max(a.count, b.count)
        var a = a.reversed().compactMap { Int("\($0)") }
        var b = b.reversed().compactMap { Int("\($0)") }

        while a.count < len {
            a.append(0)
        }
        while b.count < len {
            b.append(0)
        }

        var res = ""
        var carry = false

        for i in 0..<len {
            if !carry {
                res += (a[i] ^ b[i] == 0) ? "0" : "1"
                carry = a[i] & b[i] == 1
            } else {
                res += (a[i] ^ b[i]  == 0) ? "1" : "0"
                carry = a[i] | b[i] == 1
            }
        }

        if carry {
            res += "1"
        }

        return String(res.reversed())
    }
}