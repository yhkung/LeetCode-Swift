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

/// Merge Sort
/// Improvoment space complexity
class Solution {
    func sortArray(_ nums: [Int]) -> [Int] {
        var nums = nums
        var temp = Array(repeating: 0, count: nums.count)
        mergeSort(&nums, 0, nums.count - 1, &temp)
        return nums
    }

    private func mergeSort(_ nums: inout [Int], _ start: Int, _ end: Int, _ temp: inout [Int]) {
        if start >= end {
            return
        }
        let mid = start + (end - start) / 2
        mergeSort(&nums, start, mid, &temp)
        mergeSort(&nums, mid + 1, end, &temp)
        merge(&nums, start, end, &temp)
    }

    private func merge(_ nums: inout [Int], _ start: Int, _ end: Int, _ temp: inout [Int]) {
        let mid = start + (end - start) / 2
        var leftIndex = start
        var rightIndex = mid + 1
        var index = start

        while leftIndex <= mid && rightIndex <= end {
            if nums[leftIndex] < nums[rightIndex] {
                temp[index] = nums[leftIndex]
                leftIndex += 1
            } else {
                temp[index] = nums[rightIndex]
                rightIndex += 1
            }
            index += 1
        }

        while leftIndex <= mid {
            temp[index] = nums[leftIndex]
            leftIndex += 1
            index += 1
        }

        while rightIndex <= end {
            temp[index] = nums[rightIndex]
            rightIndex += 1
            index += 1
        }

        nums[start...end] = temp[start...end]
    }

}