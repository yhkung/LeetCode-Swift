/// 997 - Find The Town Judge
/// - Link: https://leetcode.com/problems/find-the-town-judge/
/// - Time: O(E), Recall that N is the number of people, and E is the number of edges (trust relationships).
/// - Space: O(N)
class Solution {
    func findJudge(_ N: Int, _ trust: [[Int]]) -> Int {
        if trust.count < N - 1 {
            return -1
        }
        var trustScore = Array(repeating: 0, count: N + 1)
        for relation in trust {
            trustScore[relation[0]] -= 1
            trustScore[relation[1]] += 1
        }
        for i in 1...N {
            if trustScore[i] == N - 1 {
                return i
            }
        }
        return -1
    }
}