/// 973 - K Closest Points to Origin
/// - Link: https://leetcode.com/problems/k-closest-points-to-origin/
/// - Time Complexity: *O(NlogN)*
/// - Space Complexity: *O(N)
class Solution {
    func kClosest(_ points: [[Int]], _ K: Int) -> [[Int]] {
        func distance(_ x: Int, _ y: Int) -> Int { return x * x + y * y }
        return Array(points.sorted { distance($0[0], $0[1]) < distance($1[0], $1[1]) }.prefix(K))
    }
}