/// 204. Minimum Size Subarray Sum
/// Brute force - Time Limit Exceeded
/// - Time Complexity: O(n^3)
/// - Space Complexity: O(1)
class Solution {
    func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
        guard !nums.isEmpty && s > 0 else { return 0 }
        var res = Int.max
        for i in 0..<nums.count - 1 {
            for j in i..<nums.count {
                var sum = 0
                for k in i...j {
                    sum += nums[k]
                }
                if sum >= s {
                    res = min(res, j - i + 1)
                    break
                }
            }
        }
        return res == Int.max ? 0 : res
    }
}