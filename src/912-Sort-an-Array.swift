/// 912 - Sort an Array
/// - Approach: Merge Sort
/// - Time Complexity: O(nlogn)
/// - Space Complexity: O(n)
class Solution {
    func sortArray(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else { return nums }
        return mergeSort(nums, 0, nums.count - 1)
    }

    private func mergeSort(_ nums: [Int], _ start: Int, _ end: Int) -> [Int] {
        guard end > start else { return [nums[start]] }
        var res: [Int] = []
        let mid = start + (end - start) / 2
        var left = mergeSort(nums, start, mid)
        var right = mergeSort(nums, mid + 1, end)

        while let n1 = left.first, let n2 = right.first {
            if n1 < n2 {
                res.append(left.removeFirst())
            } else {
                res.append(right.removeFirst())
            }
        }
        return res + left + right
    }

}

/// 912 - Sort an Array
/// - Approach: Quick Sort
/// - Time Complexity: O(nlogn)
/// - Space Complexity: O(n)
class Solution {
    func sortArray(_ nums: [Int]) -> [Int] {
        guard !nums.isEmpty else {
            return nums
        }
        var nums = nums
        quickSort(&nums, 0, nums.count - 1)
        return nums
    }


    private func quickSort(_ nums: inout [Int], _ start: Int, _ end: Int) {
        if start >= end {
            return
        }

        var left = start
        var right = end

        var pivot = nums[(start + end) / 2]

        while left <= right {
            while left <= right && nums[left] < pivot {
                left += 1
            }
            while left <= right && nums[right] > pivot {
                right -= 1
            }

            if left <= right {
                (nums[left], nums[right]) = (nums[right], nums[left])
                left += 1
                right -= 1
            }
        }

        quickSort(&nums, start, right)
        quickSort(&nums, left, end)
    }
}