class Solution {
    func findPeakElement(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else {
            return -1
        }

        var start = 0
        var end = nums.count - 1

        while start + 1 < end {
            let mid = start + (end - start) / 2

            if mid >= 1 && mid <= nums.count - 1 && nums[mid] > nums[mid + 1] && nums[mid] > nums[mid - 1] {
                return mid
            }

            if nums[mid] < nums[mid + 1] {
                start = mid
            } else {
                end = mid
            }
        }

        if nums[start] > nums[end] {
            return start
        } else {
            return end
        }
    }
}