/// 476 - Number Complement
/// - Link: https://leetcode.com/problems/number-complement/
class Solution {
    func findComplement(_ num: Int) -> Int {
        var n = num
        var length = 1
        while n > 1 {
            n /= 2
            length += 1
        }
        // let n = Int(log2(Double(num))) + 1
        let bitmask = 1 << length - 1
        return num ^ bitmask
    }
}