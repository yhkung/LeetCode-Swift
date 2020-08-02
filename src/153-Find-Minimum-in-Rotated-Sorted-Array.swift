/// 153 Find Minimum in Rotated Sorted Array
class Solution {
    func findMin(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums.isEmpty ? -1 : nums[0] }

        if let last = nums.last, let first = nums.first, last > first {
            return first
        }

        var low = 0
        var high = nums.count - 1
        while low < high {
            let mid = low + (high - low) / 2
            if nums[mid] > nums[high] {
                low = mid + 1
            } else {
                high = mid
            }
        }
        return nums[low]
    }
}