/// 503. Next Greater Element II
/// Approach #1 - Brute Force
/// - Time Complexity: O(n^2)
/// - Space Complexity: O(n)
class Solution {
    func nextGreaterElements(_ nums: [Int]) -> [Int] {
        var res = Array(repeating: -1, count: nums.count)
        for (i, num) in nums.enumerated() {
            var j = i + 1
            if j == nums.count {
                j = 0
            }
            while true {
                if j == nums.count {
                    j = 0
                }
                guard j != i else { break }
                if nums[j] > nums[i] {
                    res[i] = nums[j]
                    break
                }
                j += 1
            }
        }
        return res
    }
}

/// 503. Next Greater Element II
/// Approach #2 - Using Stack
/// - Time Complexity: O(n)
/// - Space Complexity: O(n)
class Solution {
    func nextGreaterElements(_ nums: [Int]) -> [Int] {
        var res = Array(repeating: -1, count: nums.count)
        var stack = [Int]()
        for i in stride(from: 2 * nums.count - 1, through: 0, by: -1) {
            let index = i % nums.count
            while let top = stack.last, nums[top] <= nums[index] {
                stack.popLast()
            }
            if let top = stack.last {
                res[index] = nums[top]
            }
            stack.append(index)
        }
        return res
    }
}