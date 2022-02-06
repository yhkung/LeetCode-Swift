/// 048 - Rotate Image
/// https://leetcode.com/problems/rotate-image/solution/
class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        let n = matrix.count

        for i in 0..<(n + 1) / 2 {
            for j in 0..<n / 2 {
                let tmp = matrix[n - j - 1][i]
                matrix[n - j - 1][i] = matrix[n - i - 1][n - j - 1]
                matrix[n - i - 1][n - j - 1] = matrix[j][n - 1 - i]
                matrix[j][n - 1 - i] = matrix[i][j]
                matrix[i][j] = tmp
            }
        }
    }
}

class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        let n = matrix.count
        for i in 0..<n/2 {
            matrix.swapAt(i, n - i - 1)
        }

        for i in 0..<n {
            for j in i + 1..<n {
                let tmp = matrix[i][j]
                matrix[i][j] = matrix[j][i]
                matrix[j][i] = tmp
            }
        }
    }
}