/// 540 - Single Element In A Sorted Array
/// - Link: https://leetcode.com/problems/single-element-in-a-sorted-array/
/// - Time: O(logn)
/// - Space: O(1)
class Solution {
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return nums[0]
        }
        guard nums.count % 2 == 1 else {
            return -1 // Invalid input
        }
        var low = 0
        var high = nums.count - 1

        while low < high {
            let mid = low + (high + 1 - low) / 2

            if high - low == 3 {
                if nums[mid] == nums[mid - 1] {
                    return nums[high]
                } else if nums[mid] == nums[mid + 1] {
                    return nums[low]
                } else {
                    return nums[mid]
                }
            }

            let isEven = mid % 2 == 0

            if isEven {
                if nums[mid] == nums[mid - 1] {
                    low = mid - 1
                } else {
                    high = mid
                }
            } else {
                if nums[mid] == nums[mid - 1] {
                    high = mid + 1
                } else {
                    low = mid - 1
                }
            }
        }
        return -1
    }
}

class Solution {
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        var low = 0
        var high = nums.count - 1

        while low < high {
            var mid = low + (high - low) / 2

            if mid % 2 == 1 {
                mid -= 1
            }

            if nums[mid] == nums[mid + 1] {
                low += 2
            } else {
                high = mid
            }
        }
        return nums[low]
    }
}