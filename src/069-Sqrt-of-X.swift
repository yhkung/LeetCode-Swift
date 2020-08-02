/// 069. Sqrt(x)
/// Approach: Binary Search
/// Time Complexity: O(logn)
class Solution {
    func mySqrt(_ x: Int) -> Int {
        guard x > 1 else { return x }
        var low = 2
        var high = x / 2
        while low <= high {
            let mid = low + (high - low) / 2
            let midNum = mid * mid
            if midNum == x {
                return mid
            } else if x > midNum {
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
        return high
    }
}