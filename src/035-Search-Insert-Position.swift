/// 35. Search Insert Position
/// - Time Complexity: O(log(n))
class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        return binarySearch(nums, target)
        // return recursionBinarySearch(nums, 0, nums.count - 1, target)
    }

    private func recursionBinarySearch(_ nums: [Int], _ start: Int, _ end: Int, _ target: Int) -> Int {
        if start > end {
            return start
        }

        let mid = start + (end - start)/2

        if nums[mid] == target {
            return mid
        }

        if nums[mid] < target {
            return recursionBinarySearch(nums, mid + 1, end, target)
        }

        return recursionBinarySearch(nums, start, mid - 1, target)
    }

    private func binarySearch(_ nums: [Int], _ target: Int) -> Int {
        var start = 0
        var end = nums.count

        while start < end {
            let mid = start + (end - start)/2

            if nums[mid] == target {
                return mid
            }
            if nums[mid] < target {
                start = mid + 1
            } else {
                end = mid
            }
        }

        return start
    }

}