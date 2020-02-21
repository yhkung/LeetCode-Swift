/// 752 - Open The Lock
/// - Link: https://leetcode.com/problems/open-the-lock/
/// - Approach: BFS
class Solution {
    func openLock(_ deadends: [String], _ target: String) -> Int {
        let deadends: Set<[Int]> = Set(deadends.map { Array($0).compactMap { Int("\($0)") } })
        let target: [Int] = Array(target).compactMap { Int("\($0)") }
        var turns: Int = 0
        var queue: [[Int]] = []
        var visited: Set<[Int]> = Set()

        queue.append([0, 0, 0, 0])
        visited.insert([0, 0, 0, 0])

        while !queue.isEmpty {
            for _ in 0..<queue.count {
                let cur = queue.removeFirst()

                if deadends.contains(cur) {
                    continue
                }

                if cur == target {
                    return turns
                }

                for i in 0...3 {
                    for d in stride(from: -1, through: 1, by: 2) {
                        var neighbor = cur
                        neighbor[i] = ((neighbor[i] + d) + 10) % 10

                        if !visited.contains(neighbor) && !deadends.contains(neighbor) {
                            queue.append(neighbor)
                            visited.insert(neighbor)
                        }
                    }
                }
            }
            turns += 1
        }
        return -1
    }
}