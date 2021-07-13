/// 215. Kth Largest Element in Array
class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        guard !nums.isEmpty else {
            return -1
        }
        var nums = nums

        return quickSelect(&nums, 0, nums.count - 1, k)
    }

    private func quickSelect(_ nums: inout [Int], _ start: Int, _ end: Int, _ k: Int) -> Int {
        if start >= end {
            return nums[start]
        }

        var left = start
        var right = end
        var pivot = nums[(start + end) / 2]

        while left <= right {
            while left <= right && nums[left] > pivot {
                left += 1
            }
            while left <= right && nums[right] < pivot {
                right -= 1
            }
            if left <= right {
                (nums[left], nums[right]) = (nums[right], nums[left])
                left += 1
                right -= 1
            }
        }

        if start + k - 1 <= right {
            return quickSelect(&nums, start, right, k)
        }
        if start + k - 1 >= left {
            return quickSelect(&nums, left, end, k - (left - start))
        }

        return nums[right + 1]
    }
}