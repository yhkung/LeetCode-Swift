/// 992 - Subarrays with K Different Integers
class Solution {
    func subarraysWithKDistinct(_ A: [Int], _ K: Int) -> Int {
        var results: [[Int]] = []
        var start = 0
        var end = 0
        var map: [Int: Int] = []
        while end < A.count {
            let next = A[end]
            map[next, default: 0] += 1
            end += 1

            if map.count > K {
                let prev = A[start]
                map[prev, default: 0] -= 1
                if map[prev, default: 0] <= 0 {
                    map.removeValue(forKey: prev)
                }
                start += 1
            }

            if map.count == K {
                results.append(A[start...end])
            }
        }
        return results
    }
}