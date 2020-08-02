// / 984 - Interval List Intersactions
/// - Link: https://leetcode.com/problems/interval-list-intersections
/// - Time: O(M+N), where M, N are the length of `A` and `B`
/// - Space: O(M+N), the maximum size of the anwser
class Solution {
    func intervalIntersection(_ A: [[Int]], _ B: [[Int]]) -> [[Int]] {
        if A.isEmpty || B.isEmpty {
            return []
        }
        var i = 0
        var j = 0

        var res = [[Int]]()
        while i < A.count && j < B.count {
            if A[i][1] < B[j][1] {
                if A[i][1] >= B[j][0] {
                    res.append([max(A[i][0], B[j][0]), min(A[i][1], B[j][1])])
                }
                i += 1
            } else {
                if A[i][0] <= B[j][1] {
                    res.append([max(A[i][0], B[j][0]), min(A[i][1], B[j][1])])
                }
                j += 1
            }
        }

        return res
    }
}