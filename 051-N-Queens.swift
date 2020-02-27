class Solution {
    func solveNQueens(_ n: Int) -> [[String]] {
        var rows: [Int] = Array(repeating: 0, count: n)
        var results: [[String]] = []
        solveNQueens(&rows, &results ,0)
        return results
    }

    private func solveNQueens(_ rows: inout [Int], _ results: inout [[String]], _ index: Int) {
        if index == rows.count {
            results.append(generateOutput(rows))
            return
        }
        for i in 0..<rows.count {
            rows[index] = i
            if !threatDetected(rows, index) {
                solveNQueens(&rows, &results, index + 1)
            }
        }
    }

    private func threatDetected(_ rows: [Int], _ index: Int) -> Bool {
        guard index > 0 else { return false }
        var threat = false
        for prevRow in 0..<index {
            if rows[prevRow] == rows[index] {
                threat = true
            }
            var dx = abs(rows[index] - rows[prevRow])
            var dy = index - prevRow
            if dx == dy {
                threat = true
            }
        }
        return threat
    }

    private func generateOutput(_ rows: [Int]) -> [String] {
        var output: [String] = []
        for row in rows {
            var str = Array(repeating: ".", count: rows.count)
            str[row] = "Q"
            output.append(str.joined())
        }
        return output
    }

}