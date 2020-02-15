/// 042 - Trapping Rain Water
/// - Approach: Two Pointets
/// - Time Complexity: O(n)
/// - Space Complexity: O(1)
class Solution {
    func trap(_ height: [Int]) -> Int {
        var left = 0
        var right = height.count - 1
        var leftMax = 0
        var rightMax = 0
        var ans = 0
        while left < right {
            if height[left] > leftMax {
                leftMax = height[left]
            }
            if height[right] > rightMax {
                rightMax = height[right]
            }
            if leftMax < rightMax {
                ans += max(0, leftMax - height[left])
                left += 1
            } else {
                ans += max(0, rightMax - height[right])
                right -= 1
            }
        }
        return ans
    }
}