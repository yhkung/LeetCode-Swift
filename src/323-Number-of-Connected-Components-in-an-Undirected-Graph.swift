// DFS
class Solution {
    func countComponents(_ n: Int, _ edges: [[Int]]) -> Int {                
        var parent = Array(repeating: 0, count: n)
        var rank = Array(repeating: 1, count: n)
        for i in 0..<n {
            parent[i] = i            
        }       

        var result = n
        for edge in edges {
            result -= unionFind(edge[0], edge[1], &parent, &rank)
        } 
        return result
    }

    private func findParent(_ node: Int, _ parent: inout [Int]) -> Int {
        var result = node

        while parent[result] != result {
            parent[result] = parent[parent[result]]
            result = parent[result]
        }

        return result
    }

    private func unionFind(_ node1: Int, _ node2: Int, _ parent: inout [Int], _ rank: inout [Int]) -> Int {
        let p1 = findParent(node1, &parent)
        let p2 = findParent(node2, &parent)
        
        if p1 == p2 {
            return 0
        }

        if rank[p2] > rank[p1] {
            parent[p1] = p2
            rank[p2] += rank[p1]
        } else {
            parent[p2] = p1
            rank[p1] += rank[p2]
        }

        return 1
    }
}