// 740. Delete and Earn
// https://leetcode.com/problems/delete-and-earn/
// Time Complexity: O(nlogn)
// Space Complexity: O(n)
class Solution {
    func deleteAndEarn(_ nums: [Int]) -> Int {
        var values = [Int: Int]()
        for n in nums {
            values[n, default: 0] += n
        }

        var pre = 0
        var cur = 0

        for num in values.keys.sorted() {
            if values[num - 1] == nil {
                pre = cur
                cur += values[num, default: 0]
            } else {
                let tmp = max(values[num, default: 0] + pre, cur)
                pre = cur
                cur = tmp
            }
        }

        return cur
    }
}

/// Time Complexity: O(n)
/// Space Complexity: O(n)
class Solution {
    func deleteAndEarn(_ nums: [Int]) -> Int {
        var dp = Array(repeating: 0, count: 10001)

        for n in nums {
            dp[n] += n
        }

        var pre = 0
        var cur = 0

        for n in dp {
            let temp = max(n + pre, cur)
            pre = cur
            cur = temp
        }

        return cur
    }
}