/// 88 - Merge Sorted Array
/// - Approach: Two Pointers
/// - Time Complexity: O(m + n)
/// - Space Complexity: O(m + n)
class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var p1: Int = 0
        var p2: Int = 0
        var nums: [Int] = []
        while p1 < m && p2 < n {
            if nums1[p1] <= nums2[p2] {
                nums.append(nums1[p1])
                p1 += 1
            } else {
                nums.append(nums2[p2])
                p2 += 1
            }
        }
        while p1 < m {
            nums.append(nums1[p1])
                p1 += 1
        }

        while p2 < n {
            nums.append(nums2[p2])
            p2 += 1
        }
        nums1 = nums
    }
}