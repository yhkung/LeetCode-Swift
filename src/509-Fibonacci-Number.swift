class Solution {
    func fib(_ N: Int) -> Int {
        guard N > 1 else { return N }
        var prev = 0 // f(0)
        var curr = 1 // f(1)
        for _ in 0..<N-1 {
            (prev, curr) = (curr, curr + prev)
        }
        return curr
    }
}