/// 1009 - Complement of Base 10 Integer
/// - Link: https://leetcode.com/problems/complement-of-base-10-integer/
class Solution {
    func bitwiseComplement(_ N: Int) -> Int {
        guard N > 0 else { return 1 }
        var bitmask = N
        bitmask |= bitmask >> 1
        bitmask |= bitmask >> 2
        bitmask |= bitmask >> 4
        bitmask |= bitmask >> 8
        bitmask |= bitmask >> 16
        return N ^ bitmask
    }
}