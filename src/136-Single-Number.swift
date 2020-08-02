/// 136 - Single Number
/// - Link: https://leetcode.com/problems/single-number/
/// - Approach: HashMap
class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var dict: [Int: Int] = [:]
        for n in nums {
            dict[n, default: 0] += 1
        }
        for key in dict.keys {
            if let value = dict[key], value == 1 {
                return key
            }
        }
        return -1
    }
}

/// - Approach: Bit Manipulation
class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var res = 0
        for n in nums {
            res ^= n
        }
        return res
    }
}
