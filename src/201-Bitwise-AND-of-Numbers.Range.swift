class Solution {
    func rangeBitwiseAnd(_ m: Int, _ n: Int) -> Int {
        if m == 0 { return 0 }
        if m == n { return m }

        var k: Double = 0
        var val = Int(pow(2, k))
        while val <= n {
            k += 1
            val = Int(pow(2, k))
        }

        if (m+1...n).contains(val/2) {
            return 0
        } else {
            var cur = m
            for i in m+1...n {
                cur &= i
            }
            return cur
        }
    }
}