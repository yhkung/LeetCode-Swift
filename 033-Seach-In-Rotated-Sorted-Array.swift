/// 33. Search In Rotated Sorted Array
/// - Time Complexity: O(logn)
class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        guard !nums.isEmpty else { return -1 }
        if nums.count == 1  {
            return nums[0] == target ? 0 : -1
        }
        let pivot = findPivot(nums, 0, nums.count - 1)
        let sortedArray = Array(nums[pivot..<nums.count] + nums[0..<pivot])
        let index = binarySearch(sortedArray, target)
        if index == -1 {
            return -1
        } else {
            let count = nums.count - pivot
            if index >= count {
                return index - count
            } else {
                return index + pivot
            }
        }
    }

    private func findPivot(_ nums: [Int], _ start: Int, _ end: Int) -> Int {
        if nums[end] > nums[start] {
            return 0
        }
        var low = start
        var high = end
        while low <= high {
            let mid = low + (high - low) / 2
            if nums[mid] > nums[mid + 1] {
                return mid + 1
            } else {
                if nums[mid] < nums[low] {
                    high = mid
                } else {
                    low = mid + 1
                }
            }
        }
        return 0
    }

    private func binarySearch(_ nums: [Int], _ target: Int) -> Int {
        var low = 0
        var high = nums.count - 1
        while low <= high {
            let mid = low + (high - low) / 2
            if target == nums[mid] {
                return mid
            } else if target > nums[mid] {
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
        return -1
    }
}

let nums1 = [4, 5, 6, 7, 0, 1, 2]
let nums2 = [0, 1, 2]

assert(searchRotatedSortedArray(nums1, 4) == 0)
assert(searchRotatedSortedArray(nums1, 5) == 1)
assert(searchRotatedSortedArray(nums1, 6) == 2)
assert(searchRotatedSortedArray(nums1, 7) == 3)
assert(searchRotatedSortedArray(nums1, 0) == 4)
assert(searchRotatedSortedArray(nums1, 1) == 5)
assert(searchRotatedSortedArray(nums1, 2) == 6)
assert(searchRotatedSortedArray(nums1, 8) == -1)

assert(searchRotatedSortedArray(nums2, 0) == 0)
assert(searchRotatedSortedArray(nums2, 1) == 1)
assert(searchRotatedSortedArray(nums2, 2) == 2)
