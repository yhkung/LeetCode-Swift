/// 704. Binary Search
class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
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