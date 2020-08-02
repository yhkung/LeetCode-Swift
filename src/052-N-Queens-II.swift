/// 052 - N Queens II
/// - Link: https://leetcode.com/problems/n-queens-ii/
/// - Approach: Backtracking - Stack
class Solution {
    func totalNQueens(_ n: Int) -> Int {
        var count:  Int = 0
        var rows: [Int] = Array(repeating: 0, count: n)
        var stack: [(rows: [Int], index: Int)] = [(rows, 0)]

        while !stack.isEmpty {
            let cur = stack.removeLast()
            let curRows = cur.0
            let curIndex = cur.1

            if curIndex == curRows.count {
                count += 1
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

        return count
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
}