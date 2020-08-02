/// 30. Substring with Concatenation of All Words
/// - Approach: Sliding Window
class Solution {
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        guard !words.isEmpty else { return [] }
        let wordSize = words[0].count
        let windowSize = wordSize * words.count
        guard s.count >= windowSize else { return [] }

        var wordCounts: [String: Int] = [:]
        words.forEach { wordCounts[$0, default: 0] += 1}

        let s = Array(s)
        var results = [Int]()
        for i in 0..<wordSize {
            var left = i
            var right = i
            var counts: [String: Int] = wordCounts
            var found = 0
            while right <= s.count - wordSize {
                let word = String(s[right..<right + wordSize])
                right += wordSize
                if let count = counts[word] {
                    counts[word] = count - 1
                    if count == 1 {
                        found += 1
                    }
                }

                if found == counts.count {
                    result.append(left)
                }

                guard right - left == windowSize else { continue }
                let head = String(s[left..<left + wordSize])
                if let count = counts[head] {
                    counts[head] = count + 1
                    if count == 0 {
                        found -= 1
                    }
                }
                left += wordSize
            }
        }
        return results
    }
}