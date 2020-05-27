/// 886 - Possible Bipartition
/// - Link: https://leetcode.com/problems/possible-bipartition/
/// - Approach: DFS
/// - Time Complexity: *O(N+E)*, where *E* is the length of `dislikes`.
/// - Space Complexity: *O(N+E)*.
class Solution {
    func possibleBipartition(_ N: Int, _ dislikes: [[Int]]) -> Bool {
        var graph = Array(repeating: [Int](), count: N + 1)
        for d in dislikes {
            graph[d[0]].append(d[1])
            graph[d[1]].append(d[0])
        }
        var colors = Array(repeating: 0, count: N + 1)
        for i in 1...N {
            if !dfs(i, &colors, graph) {
                return false
            }
        }
        return true
    }

    private func dfs(_ node: Int, _ colors: inout [Int], _ graph: [[Int]]) -> Bool {
        for neightbor in graph[node] {
            if colors[neightbor] != 0 {
                if colors[neightbor] == colors[node] {
                    return false
                }
            } else {
                colors[neightbor] = colors[node] == 1 ? -1 : 1
                if !dfs(neightbor, &colors, graph) {
                    return false
                }
            }
        }
        return true
    }

    private func bfs(_ node: Int, _ colors: inout [Int], _ graph: [[Int]]) -> Bool {
        var graph = graph
        var queue = [node]
        while !queue.isEmpty {
            let first = queue.removeFirst()
            for neighbor in graph[first] {
                if colors[neighbor] != 0 {
                    if colors[neighbor] == colors[first] {
                        return false
                    }
                } else {
                    colors[neighbor] = colors[first] == 1 ? -1 : 1
                    queue.append(neighbor)
                }
            }
        }
        return true
    }

}