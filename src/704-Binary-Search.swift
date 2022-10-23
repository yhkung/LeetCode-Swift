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

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        guard !nums.isEmpty else { 
            return -1 
        }
        
        var start = 0
        var end = nums.count - 1

        while start + 1 < end {
            let mid = start + (end - start) / 2

            if nums[mid] == target {
                return mid
            } else if nums[mid] < target {
                start = mid
            } else {
                end = mid
            }
        }

        if nums[start] == target {
            return start
        }
        if nums[end] == target {
            return end
        }

        return -1
    }
}