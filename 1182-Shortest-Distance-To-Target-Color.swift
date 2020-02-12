/// 1182 - Shortest Distance to Target Color
/// - Approach: Dynamic Programming
/// - Time Complexity: O(n)
/// - Space Complexity: O(n)
class Solution {
    func shortestDistanceColor(_ colors: [Int], _ queries: [[Int]]) -> [Int] {
        var n = colors.count
        var leftDP = Array(
            repeating: Array(repeating: -1, count: n),
            count: 3
        )
        var rightDP = Array(
            repeating: Array(repeating: -1, count: n),
            count: 3
        )

        /// Build left maxtrix
        for color in 0..<3 {
            if colors[0] == color + 1 {
                leftDP[color][0] = 0
            }
            for i in 1..<n {
                let prev = leftDP[color][i - 1]
                if prev != -1 {
                    leftDP[color][i] = prev + 1
                }
                if colors[i] == color + 1 {
                    leftDP[color][i] = 0
                }
            }
        }

        /// Build right maxtrix
        for color in 0..<3 {
            let lastIndex = n - 1
            if colors[lastIndex] == color + 1 {
                rightDP[color][lastIndex] = 0
            }
            for i in stride(from: lastIndex - 1, through: 0, by: -1) {
                let prev = rightDP[color][i + 1]
                if prev != -1 {
                    rightDP[color][i] = prev + 1
                }
                if colors[i] == color + 1 {
                    rightDP[color][i] = 0
                }
            }
        }

        var results = [Int]()
        for q in queries {
            var index = q[0]
            var color = q[1] - 1
            var left = leftDP[color][index]
            var right = rightDP[color][index]
            let result: Int

            if left == -1 || right == -1 {
                result = max(left, right)
            } else {
                result = min(left, right)
            }
            results.append(result)
        }
        return results
    }
}