/// 003. Longest Substring Without Repeating Characters
/// - Approach: Sliding Window
/// - Time Complexity: O(n)
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard !s.isEmpty else {
            return 0
        }
        let s = Array(s)

        var maxLength = 0
        var start = 0
        var end = 0
        let n = s.count
        var memo = Set<Character>()

        while end < n {
            if memo.contains(s[end]) {
                memo.remove(s[start])
                start += 1
            } else {
                memo.insert(s[end])
                maxLength = max(maxLength, end - start + 1)
                end += 1
            }
        }
        return maxLength
    }
}

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard !s.isEmpty else {
            return 0
        }

        let s = Array(s)

        var maxLength = 0
        var start = 0
        var end = 0
        let n = s.count
        var indexes = [Character: Int]()

        while end < n {
            let next = s[end]
            if let index = indexes[next] {
                start = max(start, index)
            }

            maxLength = max(maxLength, end - start + 1)
            indexes[s[end]] = end + 1
            end += 1
        }

        return maxLength
    }
}