/// 34. Find First and Last Position of Element in Sorted Array
/// - Approach: Binary Search
/// - Time Complexity: O(log n)
class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        let start = findFirstIndex(nums, target)
        if start == nums.count || nums[start] != target {
            return [-1, -1]
        }
        return [start, findFirstIndex(nums, target + 1) - 1]
    }

    func findFirstIndex(_ nums: [Int], _ target: Int) -> Int {
        var low = 0
        var high = nums.count
        while low < high {
            let mid = low + (high - low) / 2
            if target > nums[mid] {
                low = mid + 1
            } else {
                high = mid
            }
        }
        return low
    }
}