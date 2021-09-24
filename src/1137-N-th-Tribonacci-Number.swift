/// 1137. N-th Tribonacci Number
/// Approach: DP
/// Time Complexity: O(n)
/// Space Complexity: O(1)
class Solution {
    func tribonacci(_ n: Int) -> Int {
        var arr = [0, 1, 1]
        if n < 3 {
            return arr[n]
        }
        for i in 1..<n - 1 {
            var next = arr[0] + arr[1] + arr[2]
            arr[0] = arr[1]
            arr[1] = arr[2]
            arr[2] = next
        }
        return arr[2]
    }
}

class Solution {
    func tribonacci(_ n: Int) -> Int {
        if n == 0 {
            return 0
        }
        if n == 1 || n == 2 {
            return 1
        }

        var a = 0
        var b = 1
        var c = 1

        for i in 2..<n {
            let next = a + b + c
            a = b
            b = c
            c = next
        }

        return c
    }
}