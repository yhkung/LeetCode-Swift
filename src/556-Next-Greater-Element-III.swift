/// 556. Next Greater Element III
/// Approach #2 - Linear Solution
/// - Time Complexity: O(n)
/// - Space Complexity: O(n)
class Solution {
    func nextGreaterElement(_ n: Int) -> Int {
        var a = String(n).compactMap { Int(String($0)) }
        var i = a.count - 2
        while i >= 0 && a[i + 1] <= a[i] {
            i -= 1
        }
        if i < 0 {
            return -1
        }
        var j = a.count - 1
        while j >= 0 && a[j] <= a[i] {
            j -= 1
        }
        if j < 0 {
            return -1
        }
        a.swapAt(i, j)
        let resArr = a[...i] + a[(i+1)...].reversed()
        let res = Int(resArr.map { String($0) }.reduce("") { $0 + $1 })!
        if res > Int32.max {
            return -1
        } else {
            return res
        }
    }
}