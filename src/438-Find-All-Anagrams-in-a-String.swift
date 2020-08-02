/// 438. Find All Anagrams in a String
/// https://leetcode.com/problems/find-all-anagrams-in-a-string/
/// - Approach: Sliding Window
/// - Time Complexity: O(n)
class Solution {
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        let s = Array(s)
        var sMap: [Character: Int] = [:]
        var pMap: [Character: Int] = [:]
        Array(p).forEach { pMap[$0, default: 0] += 1 }
        var start = 0
        var end = 0
        var results: [Int] = []
        while end < s.count {
            sMap[s[end], default: 0] += 1
            end += 1

            if (end - start) == p.count {
                if sMap == pMap {
                    results.append(start)
                }

                sMap[s[start]]! -= 1
                if sMap[s[start]] == 0 {
                    sMap.removeValue(forKey: s[start])
                }

                start += 1
            }
        }
        return results
    }
}