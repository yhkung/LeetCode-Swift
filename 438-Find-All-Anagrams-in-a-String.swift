/// 438. Find All Anagrams in a String
/// https://leetcode.com/problems/find-all-anagrams-in-a-string/
/// - Approach: Sliding Window
/// - Time Complexity: O(n)
class Solution {
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        let s = Array(s)
        let p = Array(p)
        var sDict = [Character: Int]()
        var pDict = [Character: Int]()
        var results = [Int]()
        for c in p {
            pDict[c, default: 0] += 1
        }

        for i in 0..<s.count {
            if i >= p.count {
                let firstChar = s[i - p.count]
                if let countForChar = sDict[firstChar] {
                    if countForChar == 1 {
                        sDict[firstChar] = nil
                    } else {
                        sDict[firstChar] = countForChar - 1
                    }
                }
            }

            sDict[s[i], default: 0] += 1

            if sDict == pDict {
                results.append(i - p.count + 1)
            }
        }

        return results
    }
}