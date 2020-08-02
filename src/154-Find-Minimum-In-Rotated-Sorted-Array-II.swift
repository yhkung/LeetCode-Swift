/// 154 Find Minimum in Rotated Sorted Array II
class Solution {
    func findMin(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums.isEmpty ? -1 : nums[0] }

        if let last = nums.last, let first = nums.first, last > first {
            return first
        }

        var low = 0
        var high = nums.count - 1
        while low < high {
            let pivot = low + (high - low) / 2
            if nums[pivot] == nums[high] {
                high -= 1
            } else if nums[pivot] > nums[high] {
                low = pivot + 1
            } else  {
                high = pivot
            }
        }
        return nums[low]
    }
}