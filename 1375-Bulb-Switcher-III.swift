/// 1375 - Bulb Switcher III
/// - Link: https://leetcode.com/problems/bulb-switcher-iii/
class Solution {
    func numTimesAllBlue(_ light: [Int]) -> Int {
        var right = 0
        var res = 0
        for i in 0..<light.count {
            right = max(right, light[i])
            res += right == i + 1 ? 1 : 0
        }
    }
}