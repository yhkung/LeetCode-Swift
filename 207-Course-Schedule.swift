/// 207 - Course Schedule
/// - Link: https://leetcode.com/problems/course-schedule/
/// - Approach: BFS Topological Sorting
class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        /// An array record prerequiestes of courses, index: Course, value: Pre-courses
        var graph: [[Int]] = Array(repeating: [], count: numCourses)

        /// An array hold the count where the course as a pre-course
        var degrees: [Int] =  Array(repeating: 0, count: numCourses)

        /// An array represent courses without any pre-course
        var courses: [Int] = []

        for prerequisite in prerequisites {
            let pre = prerequisite[0]
            let course = prerequisite[1]
            graph[course].append(pre)
            degrees[pre] += 1
        }

        for (course, degree) in degrees.enumerated() {
            if degree == 0 {
                courses.append(course)
            }
        }

        var i = 0
        while i < courses.count {
            let c = courses[i]
            for pre in graph[c] {
                degrees[pre] -= 1
                if degrees[pre] == 0 {
                    courses.append(pre)
                }
            }
            i += 1
        }

        return courses.count == numCourses
    }
}