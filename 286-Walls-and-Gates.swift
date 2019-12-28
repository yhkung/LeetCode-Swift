/// 284. Walls and Gates
/// - Time Complexity: O(mn)
class Solution {
    private let directions = [
        (1, 0),
        (-1, 0),
        (0, 1),
        (0, -1)
    ]
    private let GATE = 0
    private let EMPTY = 2147483647

    func wallsAndGates(_ rooms: inout [[Int]]) {
        guard rooms.count > 0 else { return }
        var m = rooms.count
        var n = rooms[0].count

        var queue = [(Int, Int)]()
        for row in 0..<m {
            for col in 0..<n {
                if rooms[row][col] == GATE {
                    queue.append((row, col))
                }
            }
        }

        while !queue.isEmpty {
            let point = queue.removeFirst()
            let row = point.0
            let col = point.1
            for direction in directions {
                let r = row + direction.0
                let c = col + direction.1
                if r < 0 || c < 0 || r >= m || c >= n || rooms[r][c] != EMPTY {
                    continue
                }
                rooms[r][c] = rooms[row][col] + 1
                queue.append((r, c))
            }
        }
    }

}