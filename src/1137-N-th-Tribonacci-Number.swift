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
