/// 1232 - Check If It Is a Straight Line
/// - Link: https://leetcode.com/problems/check-if-it-is-a-straight-line/
/// - Time: O(n)
/// - Space: O(1)
class Solution {
    func checkStraightLine(_ coordinates: [[Int]]) -> Bool {
        if coordinates.count < 2 {
            return false
        }
        if coordinates.count == 2 {
            return true
        }
        let first = coordinates[0]
        let second = coordinates[1]
        let m = Double(second[1] - first[1]) / Double(second[0] - first[0])

        for i in 2..<coordinates.count {
            let coor = coordinates[i]
            if Double(coor[1] - first[1]) / Double(coor[0] - first[0]) != m {
                return false
            }
        }
        return true
    }
}