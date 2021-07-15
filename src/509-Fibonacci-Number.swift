class Solution {
    func fib(_ n: Int) -> Int {
        if n == 0 {
            return 0
        }
        if n == 1 {
            return 1
        }

        var fibonacci = Array(repeating: 0, count: n + 1)

        // f(n)  - 0, 1, 1, 2, 3, 4
        //
        // index - 0, 1, 2, 3, 4, 5

        fibonacci[0] = 0
        fibonacci[1] = 1

        for i in 2...n {
            fibonacci[i] = fibonacci[i - 1] + fibonacci[i - 2]
        }

        return fibonacci[n]
    }
}

class Solution {
    func fib(_ n: Int) -> Int {
        if n == 0 {
            return 0
        }
        if n == 1 {
            return 1
        }

        var prev = 0
        var curr = 1

        for _ in 0..<n-1 {
            let sum = prev + curr
            prev = curr
            curr = sum
        }

        return curr
    }
}