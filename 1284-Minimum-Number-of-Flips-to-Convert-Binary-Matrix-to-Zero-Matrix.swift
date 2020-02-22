/// 1284. Minimum Number of Flips to Convert Binary Matrix to Zero Matrix
/// - Link: https://leetcode.com/problems/minimum-number-of-flips-to-convert-binary-matrix-to-zero-matrix/
/// - Approach: BFS
class Solution {
    func minFlips(_ mat: [[Int]]) -> Int {
        var visited: Set<[[Int]]> = Set()
        var queue: [[[Int]]] = []
        let offsets = [(0, 0), (0, 1), (0, -1), (1, 0), (-1, 0)]

        let row = mat.count
        let col = mat.first?.count ?? 0
        let target = Array(repeating: Array(repeating: 0, count: col), count: row)

        queue.append(mat)
        visited.insert(mat)

        print(target)
        var steps: Int = -1
        while !queue.isEmpty {
            steps += 1

            for _ in 0..<queue.count {
                let cur = queue.removeFirst()

                if cur == target {
                    return steps
                }

                for i in 0..<row {
                    for j in 0..<col {
                        var flipped = cur
                        for offset in offsets {
                            let r = i + offset.0
                            let c = j + offset.1
                            if r >= 0 && r < row && c >= 0 && c < col {
                                flipped[r][c] = (flipped[r][c] + 1) % 2
                            }
                        }
                        if !visited.contains(flipped) {
                            queue.append(flipped)
                            visited.insert(flipped)
                        }
                    }
                }
            }
        }
        return -1
    }
}