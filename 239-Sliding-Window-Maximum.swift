/// 239 - Sliding Window Maximum
/// - Link: https://leetcode.com/problems/sliding-window-maximum/
/// - Approach: Sliding Window
class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        guard !nums.isEmpty, k > 0 else { return [] }
        var results: [Int] = []
        var indexes: [Int] = []

        var maxIndex = 0
        for i in 0..<k {
            while let last = indexes.last, nums[i] > nums[last] {
                indexes.removeLast()
            }
            indexes.append(i)
            if nums[i] > nums[maxIndex] {
                maxIndex = i
            }
        }
        results.append(nums[maxIndex])

        for i in k..<nums.count {
            if let first = indexes.first, first == i - k {
                indexes.removeFirst()
            }
            while let last = indexes.last, nums[i] > nums[last] {
                indexes.removeLast()
            }
            indexes.append(i)
            results.append(nums[indexes.first!])
        }
        return results
    }
}