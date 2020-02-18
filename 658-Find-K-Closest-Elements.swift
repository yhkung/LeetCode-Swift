/// 658 - Find K Closest Elements
/// - Approach: Binary Search + Two Pointers
/// - Time Complexity: O(logn + k), O(logn) is for the time of binary search, while O(k) is for finding elements
/// - Space Complexity: O(k)
class Solution {
    func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        let index = binarySearch(arr, x)
        var results: [Int] = []

        var left = index
        var right = index + 1
        var k = k

        if left >= 0 && arr[left] == x {
            results.append(arr[left])
            left -= 1
            k -= 1
        }

        while k > 0 {
            if left >= 0 && right < arr.count {
                if (x - arr[left] <= arr[right] - x) {
                    results.insert(arr[left], at: 0)
                    left -= 1
                    k -= 1
                } else {
                    results.append(arr[right])
                    right += 1
                    k -= 1
                }
            } else if left >= 0 {
                results.insert(arr[left], at: 0)
                left -= 1
                k -= 1
            } else {
                results.append(arr[right])
                right += 1
                k -= 1
            }
        }

        return results
    }

    private func binarySearch(_ nums: [Int], _ target: Int) -> Int {
        var low = 0
        var high = nums.count
        while low < high {
            let mid = low + (high - low) / 2
            if nums[mid] < target {
                low = mid + 1
            } else {
                high = mid
            }
        }
        return nums[low] == target ? low : low - 1
    }
}