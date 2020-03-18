/// 645 - Set Mismatch
/// - Link: https://leetcode.com/problems/set-mismatch/
class Solution {
    func findErrorNums(_ nums: [Int]) -> [Int] {
        var set = Set<Int>()
        var duplicate = 0
        var missing = 0
        for n in nums {
            if set.contains(n) {
                duplicate = n
                break
            }
            set.insert(n)
        }
        let last = nums.count
        var expect = (1 + last) * last / 2
        var sum = nums.reduce(0) { $0 + $1 } - duplicate
        missing = expect - sum
        return [duplicate, missing]
    }
}