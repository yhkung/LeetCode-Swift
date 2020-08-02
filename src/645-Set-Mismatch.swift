/// 645 - Set Mismatch
/// - Link: https://leetcode.com/problems/set-mismatch/
/// - Time: O(n)
/// - Space: O(n)
class Solution {
    func findErrorNums(_ nums: [Int]) -> [Int] {
        var set = Set<Int>()
        var duplicate = 0
        var missing = 0
        for n in nums {
            if set.contains(n) {
                duplicate = n
                break
            }
            set.insert(n)
        }
        let last = nums.count
        var expect = (1 + last) * last / 2
        var sum = nums.reduce(0) { $0 + $1 } - duplicate
        missing = expect - sum
        return [duplicate, missing]
    }
}

/// 645 - Set Mismatch
/// - Link: https://leetcode.com/problems/set-mismatch/
/// - Time: O(n)
/// - Space: O(1)
class Solution {
    func findErrorNums(_ nums: [Int]) -> [Int] {
        var nums = nums
        var duplicateNum = 0
        var missingNum = 0
        for i in nums {
            if nums[i - 1] < 0 {
                duplicateNum = i
            } else {
                nums[i - 1] *= -1
            }
        }
        for i in 0..<nums.count {
            if nums[i] > 0 {
                missingNum = i + 1
            }
        }
        return [duplicateNum, missingNum]
    }
}

/// - Cyclic Sort
class Solution {
    func findErrorNums(_ nums: [Int]) -> [Int] {
        var nums = nums
        var i = 0
        while i < nums.count {
            var j = nums[i] - 1
            if j < nums.count && nums[i] != nums[j] {
                var tmp = nums[i]
                nums[i] = nums[j]
                nums[j] = tmp
            } else {
                i += 1
            }
        }
        var duplicateNum = 0
        var missingNum = nums.count
        for i in 0..<nums.count {
            if nums[i] != i + 1 {
                duplicateNum = nums[i]
                missingNum = i + 1
                break
            }
        }
        return [duplicateNum, missingNum]
    }
}