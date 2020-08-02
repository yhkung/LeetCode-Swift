/// 76. Minimum Window Substring
/// Time Complexity: O(n)
class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        guard !s.isEmpty && !t.isEmpty else { return "" }
        let s = Array(s)
        var start = 0
        var end = 0
        var minStart = 0
        var minLength = Int.max
        var dict = t.reduce(into:[Character: Int]()) { $0[$1, default: 0] += 1 }
        var counter = t.count

        while end < s.count {
            if let value = dict[s[end]], value > 0 {
                counter -= 1
            }

            dict[s[end], default: 0] -= 1
            end += 1

            while counter == 0 {
                if end - start < minLength {
                    minLength = end - start
                    minStart = start
                }

                dict[s[start], default: 0] += 1

                if let value = dict[s[start]], value > 0 {
                    counter += 1
                }

                start += 1
            }
        }

        return minLength == Int.max ? "" : String(s[minStart..<minStart + minLength])
    }
}
