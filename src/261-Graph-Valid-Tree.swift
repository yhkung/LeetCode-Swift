class Solution {
    func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
        var neighbors = Array(repeating: [Int](), count: n)

        for edge in edges {
            neighbors[edge[0]].append(edge[1])
            neighbors[edge[1]].append(edge[0])
        }

        var visit = Set<Int>()

        func dfs(_ n: Int, _ prev: Int) -> Bool {
            if visit.contains(n) {
                return false
            }
            visit.insert(n)
            for nei in neighbors[n] {
                if nei == prev {
                    continue
                }
                let res = dfs(nei, n)
                if res == false {
                    return false
                }                
            }
            return true
        }                

        return dfs(0, -1) && visit.count == n
    }
}

// neighbors = [[1, 2, 3], [0, 4], [0], [0], [1]]
// visit = {0, 4, 2, 3, 1}
// i == 0
// 