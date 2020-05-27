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
        for i in 0..<graph[node].count {
            let otherNode = graph[node][i]
            if colors[otherNode] != 0 {
                if colors[otherNode] == colors[node] {
                    return false
                }
            } else {
                colors[otherNode] = colors[node] == 1 ? -1 : 1
                if !dfs(otherNode, &colors, graph) {
                    return false
                }
            }
        }
        return true
    }

}