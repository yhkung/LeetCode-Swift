/// 279 - Perfect Squares
/// - Link: https://leetcode.com/problems/perfect-squares/
/// - Approach: BFS
class Solution {
    func numSquares(_ n: Int) -> Int {
        var visited: Set<Int> = Set()
        var queue: [Int] = []

        queue.append(0)

        var steps = 0
        while !queue.isEmpty {
            steps += 1

            for _ in 0..<queue.count {
                let cur = queue.removeFirst()
                for i in 1..<n {
                    let sum = cur + (i * i)
                    if sum == n {
                        return steps
                    } else if sum > n {
                        break
                    } else {
                        if !visited.contains(sum) {
                            queue.append(sum)
                            visited.insert(sum)
                        }
                    }
                }
            }
        }
        return steps
    }
}

/// 279 - Perfect Squares
/// - Link: https://leetcode.com/problems/perfect-squares/
/// - Approach: DP
class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        guard amount > 0 else { return 0 }
        var dp: [Int] = [0]
        for i in 1...amount {
            var num = amount + 1
            for c in coins {
                if i >= c {
                    num = min(num, dp[i - c] + 1)
                }
            }
            dp.append(num)
        }
        return dp[amount] > amount ? -1 : dp[amount]
    }
}
