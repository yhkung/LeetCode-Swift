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
                    } else if sum > amount {
                        continue
                    } else {
                        if !visited.contains(sum) {
                            queue.append(sum)
                            visited.insert(sum)
                        }
                    }
                }
            }
        }
        return -1
    }
}