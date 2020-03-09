/// 1337 - The K Weakest Rows in a Matrix
/// - Link: https://leetcode.com/problems/the-k-weakest-rows-in-a-matrix/
class Solution {
    func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
        var m = mat.count
        var n = mat.first?.count ?? 0
        var res: [Int] = []
        var seen: Set<Int> = Set()
        for col in 0..<n {
            for row in 0..<m {
                if mat[row][col] == 0 {
                    if !seen.contains(row) {
                        res.append(row)
                        seen.insert(row)
                        if res.count == k { break }
                    }
                }
            }
            if res.count == k { break }
        }
        var row = 0
        while row < m && res.count < k {
            if !seen.contains(row) {
                res.append(row)
                if res.count == k { break }
            }
            row += 1
        }
        return res
    }
}