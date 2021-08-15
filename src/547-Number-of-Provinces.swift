/// 547. Number of Provinces
/// https://leetcode.com/problems/number-of-provinces/
/// Time Complexity: O(n*n)
/// Space Complexity: O(n)
class Solution {
    func findCircleNum(_ isConnected: [[Int]]) -> Int {
        guard !isConnected.isEmpty else { return 0 }

        let n = isConnected.count
        var visited = Array(repeating: false, count: n)
        var numberOfProvinces = 0

        for i in 0..<n {
            guard !visited[i] else { continue  }

            numberOfProvinces += 1
            visited[i] = true

            var queue = [Int]()
            queue.append(i)

            while !queue.isEmpty {
                let city = queue.removeFirst()
                for j in 0..<n where !visited[j] && isConnected[city][j] == 1 {
                    visited[j] = true
                    queue.append(j)
                }
            }
        }

        return numberOfProvinces
    }
}