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

class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        if t.isEmpty { return "" }

        let s = Array(s)
        let t = Array(t)
        var countT = t.reduce(into: [Character: Int]()) { $0[$1, default: 0] += 1 }
        var window = [Character: Int]()
        
        var res: (Int, Int) = (0, 0)
        var minLength = Int.max
        var left = 0
        var have = 0
        var need = countT.count

        for right in 0..<s.count {
            window[s[right], default: 0] += 1

            if let count = countT[s[right]], count == window[s[right], default: 0] {
                have += 1
            }

            while have == need {
                if right - left + 1 < minLength {
                    res = (left, right)
                    minLength = right - left + 1
                }

                window[s[left], default: 0] -= 1

                if let count = countT[s[left]], window[s[left], default: 0] < count {
                    have -= 1
                }

                left += 1
            }
        }
        
        if minLength == Int.max {
            return ""
        }

        return String(s[res.0...res.1])
    }
}