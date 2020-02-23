/// 322 - Coin Change
/// - Approach: DP
class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        guard amount > 0 else { return 0 }
        var dp: [Int] = [0]
        for i in 1...amount {
            var num = amount + 1
            for c in coins {
                if i > c {
                    num = min(num, dp[i - c] + 1)
                }
            }
            dp.append(num)
        }
        return dp[amount] > amount ? -1 : dp[amount]
    }
}

/// 322 - Coin Change
/// - Approach: BFS
class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        guard amount > 0 else { return 0 }
        var queue: [Int] = []
        var visited: Set<Int> = Set()
        queue.append(0)
        var num = 0
        while !queue.isEmpty {
            num += 1
            for _ in 0..<queue.count {
                let cur = queue.removeFirst()
                for coin in coins {
                    let sum = cur + coin
                    if sum == amount {
                        return num
                    }
                    if sum < amount && !visited.contains(sum) {
                        queue.append(sum)
                        visited.insert(sum)
                    }
                }
            }
        }
        return -1
    }
}