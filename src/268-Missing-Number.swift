/// https://leetcode.com/problems/missing-number/
/// 268 - Missing Number
/// Approacha: Mathematics
/// Time Complexity: O(n)
/// Space Complexity: O(1)
class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        let expectedSum = ((1 + nums.count) * nums.count / 2)
        var actualSum = nums.reduce(0) { $0 + $1 }
        return expectedSum - actualSum
    }
}


/// Approach: Cyclic sort
/// Time Complexity: O(n)
/// Space Complexity: O(1)
class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        var nums: [Int] = nums
        var i = 0
        var n = nums.count
        while i < n {
            let j = nums[i]
            if j < n && nums[i] != nums[j] {
                var tmp = nums[i]
                nums[i] = nums[j]
                nums[j] = tmp
            } else {
                i += 1
            }
        }
        var missed = n
        for (i, n) in nums.enumerated() {
            if n != i {
                missed = i
                break
            }
        }
        return missed
    }
}