/// 1046 - Last Stone Weight
/// - Link: https://leetcode.com/problems/last-stone-weight/
/// - Approach: Sorted Array-Based Simulation
/// - Time: O(N^2)
class Solution {
    func lastStoneWeight(_ stones: [Int]) -> Int {
        var stones = stones
        while stones.count > 1 {
            stones = stones.sorted()
            var first = stones.removeLast()
            var second = stones.removeLast()
            var newWeight = abs(first - second)
            stones.append(newWeight)
        }
        return stones.first ?? -1
    }
}

/// - Approach: Bucket Sort
/// - Time: O(N + W)
/// - Space: O(W)
class Solution {
    func lastStoneWeight(_ stones: [Int]) -> Int {
        guard !stones.isEmpty else { return 0 }
        var maxWeight = stones.max()!
        var buckets = Array(repeating: 0, count: maxWeight)
        for weight in stones {
            buckets[weight] += 1
        }

        var biggestWeight = 0
        var currentWeight = maxWeight

        while currentWeight > 0 {
            if buckets[currentWeight] == 0 {
                currentWeight -= 1
                continue
            }

            if biggestWeight == 0 {
                buckets[currentWeight] %= 2
                if buckets[currentWeight] == 1 {
                    biggestWeight = currentWeight
                }
                currentWeight -= 1
                continue
            } else {
                buckets[currentWeight] -= 1
                var newWeight = biggestWeight - currentWeight
                if newWeight <= currentWeight {
                    buckets[newWeight] += 1
                    biggestWeight = 0
                } else {
                    biggestWeight -= currentWeight
                }
            }
        }

        return biggestWeight
    }
}