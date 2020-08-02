/// 576 - Permutation in String
/// - Link: https://leetcode.com/problems/permutation-in-string/
/// - Time: O(m + n), where m is the length of s1, n is the length of s2
/// - Space: O(m + n), where m is the length of s1, n is the length of s2
class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        let s1 = Array(s1)
        let s2 = Array(s2)

        var s1Count = Array(repeating: 0, count: 26)
        var s2Count = Array(repeating: 0, count: 26)

        for i in 0..<s1.count {
            s1Count[indexOf(s1[i])] += 1
        }

        var res = false
        for i in 0..<s2.count {
            if i >= s1.count {
                let index = indexOf(s2[i - s1.count])
                s2Count[index] = max(s2Count[index] - 1, 0)
            }
            s2Count[indexOf(s2[i])] += 1

            if s1Count == s2Count {
                res = true
                break
            }
        }

        return res
    }

    private func indexOf(_ c: Character) -> Int {
        return Int(c.asciiValue!) - Int(Character("a").asciiValue!)
    }
}