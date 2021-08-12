/// https://leetcode.com/problems/triangle/
class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        guard !triangle.isEmpty else {
            return 0
        }
        guard triangle.count > 1 else {
            return triangle[0][0]
        }

        var minPath: [Int] = triangle.last!

        for layer in (0...triangle.count - 2).reversed() {
            for i in 0...layer {
                minPath[i] = min(minPath[i], minPath[i + 1]) + triangle[layer][i]
            }
        }

        return minPath[0]
    }
}