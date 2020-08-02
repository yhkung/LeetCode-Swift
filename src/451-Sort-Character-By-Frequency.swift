/// 451. Sort Characters By Frequency
/// - Link: https://leetcode.com/problems/sort-characters-by-frequency/
/// - Approach 1: HashMap + Sort
/// - Time: O(n + klogk)
/// - Space: O(n)
class Solution {
    func frequencySort(_ s: String) -> String {
        var sCount = [Character: Int]()
        for c in s {
            sCount[c, default: 0] += 1
        }
        var sortedKeys = sCount.keys.sorted { sCount[$0]! > sCount[$1]! }
        var res: String = ""
        for key in sortedKeys {
            res += Array(repeating: key, count: sCount[key]!)
        }
        return res
    }
}

/// - Approach 2: HashMap + Sort
/// - Time: O(n + klogk)
/// - Space: O(n)
class Solution {
    func frequencySort(_ s: String) -> String {
        return Array(s)
            .reduce(into: [Character: Int]()) { $0[$1, default: 0] += 1 }
            .sorted { $0.value > $1.value }
            .compactMap { String(repeating: $0, count: $1) }
            .joined()
    }
}

/// - Approach 3: Bucket Sort
/// - Time: O(n)
/// - Space: O(n)
class Solution {
    func frequencySort(_ s: String) -> String {
        let s = Array(s)
        var dict = [Character: Int]()
        for char in s {
            dict[char, default: 0] += 1
        }

        let maximumCount = dict.values.max() ?? 0
        var buckets = Array(repeating: [Character](), count: maximumCount + 1)

        for (char, count) in dict {
            buckets[count].append(char)
        }
        var res = ""
        for i in (0..<buckets.count).reversed() {
            for c in buckets[i] {
                res += String(repeating: c, count: i)
            }
        }
        return res
    }
}