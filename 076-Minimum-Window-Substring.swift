/// 76. Minimum Window Substring
/// Time Complexity: O(n)
class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        guard !s.isEmpty && !t.isEmpty else { return "" }
        let s = Array(s)
        let t = Array(t)
        var start = 0
        var end = 0
        var minStart = 0
        var minLength = Int.max
        var dict = [Character: Int]()
        t.forEach { dict[$0, default: 0] += 1 }
        var counter = t.count

        // Move end to find a valid window.
        while end < s.count {
            let c = s[end]

            // If char in s exists in t, decrease counter
            if let count = dict[c], count > 0 {
                counter -= 1
            }

            // Decrease dict[c]. If char does not exist in t, dict[c] will be negative.
            dict[c, default: 0] -= 1

            end += 1

            // When we found a valid window, move start to find smaller window.
            while counter == 0 {
                if end - start < minLength {
                    minStart = start
                    minLength = end - start
                }
                let c = s[start]
                dict[c, default: 0] += 1
                if let count = dict[c], count > 0 {
                    counter += 1
                }
                start += 1
            }
        }

        return minLength == Int.max ? "" : String(s[minStart..<minStart+minLength])
    }
}