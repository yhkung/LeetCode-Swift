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
