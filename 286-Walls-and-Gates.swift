/// 284. Walls and Gates
/// - Time Complexity: O(mn)
/// - Space Complexity: O(mn)
class Solution {
    private let directions = [
        (1, 0),
        (-1, 0),
        (0, 1),
        (0, -1)
    ]

    private let WALL = -1
    private let GATE = 0
    private let EMPTY_ROOM = 2147483647

    func wallsAndGates(_ rooms: inout [[Int]]) {
        guard !rooms.isEmpty, let first = rooms.first else { return }
        var m = rooms.count
        var n = first.count

        var queue: [(Int, Int)] = []
        for i in 0..<m {
            for j in 0..<n {
                if rooms[i][j] == GATE {
                    queue.append((i, j))
                }
            }
        }

        var steps = 0
        while !queue.isEmpty {
            for _ in 0..<queue.count {
                var cur = queue.removeFirst()
                let row = cur.0
                let col = cur.1

                if rooms[row][col] == EMPTY_ROOM {
                    rooms[row][col] = steps
                }

                if rooms[row][col] != WALL {
                    for dir in directions {
                        let next = (row + dir.0, col + dir.1)
                        let isValid = next.0 >= 0 && next.0 < m &&
                                      next.1 >= 0 && next.1 < n
                        if isValid && rooms[next.0][next.1] == EMPTY_ROOM {
                            queue.append(next)
                        }
                    }
                }
            }
            steps += 1
        }
    }
}