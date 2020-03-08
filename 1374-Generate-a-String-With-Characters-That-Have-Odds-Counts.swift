/// 1374 - Generate a String With Characters That Have Odd Counts
class Solution {
    func generateTheString(_ n: Int) -> String {
        if n % 2 == 0 {
            return String(Array(repeating: "a", count: n - 1)) + "b"
        } else {
            return String(Array(repeating: "a", count: n))
        }
    }
}