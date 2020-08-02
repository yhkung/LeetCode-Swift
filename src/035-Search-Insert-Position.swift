/// 35. Search Insert Position
/// - Time Complexity: O(log(n))
class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
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