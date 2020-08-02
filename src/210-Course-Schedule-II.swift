/// 21- - Course Schedule II
/// - Link: https://leetcode.com/problems/course-schedule-ii/
/// - Approach: Node Indegree
class Solution {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var indegree = Array(repeating: 0, count: numCourses)
        var outdegree = Array(repeating: [Int](), count: numCourses)

        for i in 0..<prerequisites.count {
            let pair = prerequisites[i]
            indegree[pair[0]] += 1
            outdegree[pair[1]] += [pair[0]]
        }

        var pending = [Int]()
        for i in 0..<numCourses {
            if indegree[i] == 0 {
                pending.append(i)
            }
        }

        var ordering = [Int]()
        while !pending.isEmpty {
            let cur = pending.removeFirst()
            ordering.append(cur)

            for c in outdegree[cur] {
                indegree[c] -= 1
                if indegree[c] == 0 {
                    pending.append(c)
                }
            }
        }

        if ordering.count != numCourses {
            ordering = []
        }
        return ordering
    }
}