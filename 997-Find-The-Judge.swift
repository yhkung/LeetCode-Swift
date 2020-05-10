/// 997 - Find The Town Judge
/// - Link: https://leetcode.com/problems/find-the-town-judge/
class Solution {
    func findJudge(_ N: Int, _ trust: [[Int]]) -> Int {
        var dict = [Int: [Int]]()
        for i in 0..<N {
            dict[i+1] = [i+1]
        }
        for t in trust {
            let person = t[0]
            let trustee = t[1]
            dict.removeValue(forKey: person)
            if let people = dict[trustee] {
                dict[trustee] = people + [person]
            }
        }
        var judge = -1
        for (trustee, people) in dict {
            if people.count == N {
                judge = trustee
                break
            }
        }
        return judge
    }
}

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