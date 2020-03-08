/// 1375 - Bulb Switcher III
/// - Link: https://leetcode.com/problems/bulb-switcher-iii/
class Solution {
    func numTimesAllBlue(_ light: [Int]) -> Int {
        var bulbs: [Bool] = Array(repeating: false, count: light.count)
        var results: Int = 0
        var curBlue = 0
        var curMaximumBulb = 0
        for i in 0..<light.count {
            bulbs[light[i] - 1] = true
            curMaximumBulb = max(curMaximumBulb, light[i] - 1)
            var blue = true
            for j in curBlue..<curMaximumBulb {
                if bulbs[j] == false {
                    blue = false
                    break
                }
            }
            if blue == true {
                results += 1
                curBlue = curMaximumBulb
            }
        }
        return results
    }
}