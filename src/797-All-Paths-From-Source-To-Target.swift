class Solution {
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        var results = [[Int]]()
        var path = [0]
        backtracking(graph, 0, &path, &results)
        return results
    }

    private func backtracking(
        _ graph: [[Int]],
        _ num: Int,
        _ path: inout [Int],
        _ results: inout [[Int]]
    ) {
        if let last = path.last, last == graph.count - 1 {
            results.append(path)
            return
        }
        let next = graph[num]
        for n in next {
            path.append(n)
            backtracking(graph, n, &path, &results)
            path.removeLast()
        }
    }
}