/// 119 - Pascal's Triangle II
/// - Time Complexity: O(k^2)
/// - Space Complexity: O(k)
class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        if rowIndex == 0 {
            return [1]
        }
        var prev = [1, 1]
        for i in 1...rowIndex {
            var curr = [1]
            for j in 1..<i {
                curr.append(prev[j - 1] + prev[j])
            }
            curr.append(1)
            prev = curr
        }
        return prev
    }
}