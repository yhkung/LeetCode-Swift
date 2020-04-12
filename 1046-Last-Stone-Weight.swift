/// 1046 - Last Stone Weight
/// - Link: https://leetcode.com/problems/last-stone-weight/
class Solution {
    func lastStoneWeight(_ stones: [Int]) -> Int {
        var stones = stones
        while stones.count > 1 {
            stones = stones.sorted()
            var first = stones.removeLast()
            var second = stones.removeLast()
            var newWeight = abs(first - second)
            stones.append(newWeight)
        }
        return stones.first ?? -1
    }
}