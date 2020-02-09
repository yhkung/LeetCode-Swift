/// 33. Search In Rotated Sorted Array
/// - Approach: Two-Pass binary search
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

/// 33. Search In Rotated Sorted Array
/// - Approach: One-Pass binary search
/// - Time Complexity: O(logn)
/// - Space Complexity: O(1)
class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var low = 0
        var high = nums.count
        while low < high {
            let mid = low + (high - low) / 2
            if nums[mid] == target {
                return mid
            }

            /// Left side is sorted
            if nums[low] <= nums[mid] {

                /// nums[low] <= target < nums[mid], means the target number locate in left side
                /// So we can move `high` pointer to mid
                if nums[low] <= target && target < nums[mid] {
                    high = mid
                } else {
                    low = mid + 1
                }
            }
            /// Right side is sorted
            else {
                /// Notice - Using `high - 1` of number array prevent from index of range
                /// nums[mid] <= target <= nums[high - 1], means the target number locate in left side
                /// So we can move `high` pointer to mid
                if nums[mid] <= target && target <= nums[high - 1] {
                    low = mid + 1
                } else {
                    high = mid
                }
            }
        }
        return -1
    }
}