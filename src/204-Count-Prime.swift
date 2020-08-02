/// 204 - Count Prime
/// - Link: https://leetcode.com/problems/count-primes/
class Solution {
    func countPrimes(_ n: Int) -> Int {
        guard n > 0 else { return 0 }
        var res = 0
        for num in 1..<n {
            if isPrime(num) {
                res += 1
            }
        }
        return res
    }

    private func isPrime(_ n: Int) -> Bool {
        if n <= 3 {
            return n > 1
        }
        var isPrime = true
        var num = 2
        while num * num < n {
            if n % num == 0 {
                isPrime = false
                break
            }
            num += 1
        }
        return isPrime
    }
}

/// - Approach: Sieve of Eratosthenes (?)
class Solution {
    func countPrimes(_ n: Int) -> Int {
        var count = 0
        var isPrime = Array(repeating: true, count: n)
        for i in 2..<n {
            if isPrime[i] == false {
                continue
            }

            count += 1
            var j = 2
            while i * j < n {
                isPrime[i * j] = false
                j += 1
            }
        }
        return count
    }
}