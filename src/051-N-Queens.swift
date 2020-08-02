/// 051 - N Queens
/// - Link: https://leetcode.com/problems/n-queens/
/// - Approach: Backtracking - Recursion
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

/// 051 - N Queens
/// - Link: https://leetcode.com/problems/n-queens/
/// - Approach: Backtracking - Stack
class Solution {
    func solveNQueens(_ n: Int) -> [[String]] {
        var results: [[String]] = []
        var rows: [Int] = Array(repeating: 0, count: n)
        var stack: [(rows: [Int], index: Int)] = [(rows, 0)]

        while !stack.isEmpty {
            let cur = stack.removeLast()
            let curRows = cur.0
            let curIndex = cur.1

            if curIndex == curRows.count {
                let board = generateBoard(curRows)
                results.append(board)
                continue
            }

            for i in 0..<n {
                var nextRows = curRows
                nextRows[curIndex] = i
                if !threatDetected(nextRows, curIndex) {
                    stack.append((nextRows, curIndex + 1))
                }
            }
        }

        return results
    }

    private func threatDetected(_ rows: [Int], _ index: Int) -> Bool {
        var checkRow = index - 1
        while checkRow >= 0 {
            if rows[checkRow] == rows[index] {
                return true
            }

            let dx = abs(rows[checkRow] - rows[index])
            let dy = index - checkRow
            if dx == dy {
                return true
            }
            checkRow -= 1
        }
        return false
    }

    private func generateBoard(_ rows: [Int]) -> [String] {
        var results: [String] = []
        for r in rows {
            var str = Array(repeating: ".", count: rows.count)
            str[r] = "Q"
            results.append(str.joined())
        }
        return results
    }
}