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

/// 204. Minimum Size Subarray Sum
/// Two Pointer
/// - Time Complexity: O(n)
/// - Space Complexity: O(1)
class Solution {
    func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
        var minSize = Int.max
        var sum = 0
        var left = 0
        for i in 0..<nums.count {
            sum += nums[i]
            while sum >= s {
                minSize = min(minSize, i + 1 - left)
                sum -= nums[left]
                left += 1
            }
        }
        return minSize != Int.max ? minSize : 0
    }
}