/// 207 - Course Schedule
/// - Link: https://leetcode.com/problems/course-schedule/
/// - Approach: BFS Topological Sorting
/// 207 - Course Schedule
class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {

        /// Array to keep tracking neighbors of course
        var neighbors: [[Int]] = Array(repeating: [], count: numCourses)

        /// Array to keep tracking prerequisites courses count of course
        var degreeOfCourses: [Int] = Array(repeating: 0, count: numCourses)

        var queue: [Int] = []

        for pre in prerequisites {
            let preCourse = pre[1]
            let course = pre[0]
            neighbors[preCourse].append(course)
            degreeOfCourses[course] += 1
        }

        for course in 0..<degreeOfCourses.count {
            if degreeOfCourses[course] == 0 {
                queue.append(course)
            }
        }

        while !queue.isEmpty {
            let course = queue.removeFirst()
            for c in neighbors[course] {
                degreeOfCourses[c] -= 1
                if degreeOfCourses[c] == 0 {
                    queue.append(c)
                }
            }
        }

        var count: Int = 0
        for d in degreeOfCourses { if d > 0 { return false } }
        return true
    }
}

/// - Approach: DFS
/// Time: O(n + E)

class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var preMap = [Int: [Int]]() // [1: [0]]
        for pre in prerequisites {
            preMap[pre[1], default: []].append(pre[0])            
        }
        var visit = Set<Int>()

        func dfs(_ course: Int) -> Bool {
            if visit.contains(course) {
                return false
            }            
            if preMap[course, default: []].isEmpty {
                return true
            }
            visit.insert(course)
            for pre in preMap[course, default: []] {
                if dfs(pre) == false {
                    return false
                }
            }
            visit.remove(course)
            preMap[course] = []
            return true
        }

        for c in 0..<numCourses {
            if dfs(c) == false {
                return false
            }
        }

        return true
    }    
}