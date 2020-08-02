/// 74. Search a 2D Matrix
/// Approach: Binary Search
/// Time Complexity: O(logn)
/// Space Complexity: O(n)
class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard !matrix.isEmpty { return false }
        var m = matrix.count
        var n = maxtrix[0].count
        var low = 0
        var high = m * n
        while low < high {
            let mid = low + (high - low) / 2
            let num = matrix[mid / m][mid % n]
            if num == target { return true
            } else if num < target {
                low = mid + 1
            } else {
                high = mid
            }
        }
        return -1
    }

    func binarySearch(_ nums: [Int], _ target: Int) -> Int {
        var low = 0
        var high = nums.count - 1
        while low <= high {
            let mid = low + (high - low) / 2
            if nums[mid] == target {
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

/// 74. Search a 2D Matrix
/// Approach: Binary Search
/// Time Complexity: O(logn)
/// Space Complexity: O(1)
class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard !matrix.isEmpty else { return false }
        let m = matrix.count
        let n = matrix[0].count
        var low = 0
        var high = m * n
        while low < high {
            let mid = low + (high - low) / 2
            let num = matrix[mid / n][mid % n]
            if num == target {
                return true
            } else if target > num {
                low = mid + 1
            } else {
                high = mid
            }
        }
        return false
    }
}