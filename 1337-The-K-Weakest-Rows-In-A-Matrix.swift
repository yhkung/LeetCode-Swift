/// 1337 - The K Weakest Rows in a Matrix
/// - Link: https://leetcode.com/problems/the-k-weakest-rows-in-a-matrix/
/// - Approach: Vertical Iteration
/// - Time Complexity: O(mn)
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

/// - Approach: Binary Search
/// - Time Complexity: O(m(logm + logn)) / O(m*logm*n)
class Solution {
    func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
        var m = mat.count
        var n = mat.first?.count ?? 0
        var res: [Int] = []
        var map: [Int: [Int]] = [:]

        /// O(mlogn)
        for row in 0..<m {
            let str = strength(mat[row])
            map[str, default: []].append(row)
        }

        /// O(mlogm)
        for key in map.keys.sorted() {
            for row in map[key, default: []] {
                res.append(row)
                if res.count == k { break }
            }
            if res.count == k { break }
        }
        return res
    }

    func strength(_ nums: [Int]) -> Int {
        var lo = 0
        var hi = nums.count
        while lo < hi {
            let mid = lo + (hi - lo) / 2
            if nums[mid] == 0 {
                hi = mid
            } else {
                lo = mid + 1
            }
        }
        return lo
    }
}