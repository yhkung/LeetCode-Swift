/// 015 - Three Sum
/// - Approach: Two Pointers
/// - Time Complexity: O(n^2)
class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count >= 3 else { return [] }
        let nums = nums.sorted()
        var results: [[Int]] = []
        for i in 0..<nums.count - 2 {
            // Skip duplicate
            if i > 0 && nums[i] == nums[i - 1] {
                continue
            }
            let sum = 0 - nums[i]
            var lo = i + 1
            var hi = nums.count - 1
            while lo < hi {
                if nums[lo] + nums[hi] == sum {
                    results.append([nums[i], nums[lo] ,nums[hi]])
                    while lo < hi && nums[lo] == nums[lo + 1] { lo += 1 }
                    while lo < hi && nums[hi] == nums[hi - 1] { hi -= 1 }
                    lo += 1
                    hi -= 1
                } else if nums[lo] + nums[hi] < sum {
                    lo += 1
                } else {
                    hi -= 1
                }
            }
        }
        return results
    }
}

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count >= 3 else {
            return []
        }
        var nums = nums.sorted()
        var results = [[Int]]()

        for i in 0..<nums.count {
            if i > 0 && nums[i] == nums[i - 1] {
                continue
            }
            findTwoSum(nums[i], nums, i + 1, nums.count - 1, &results)
        }

        return results
    }

    private func findTwoSum(_ num: Int, _ nums: [Int], _ start: Int, _ end: Int, _ results: inout [[Int]]) {
        var start = start
        var end = end
        let target = -num

        while start < end {
            let sum = nums[start] + nums[end]

            if sum < target {
                start += 1
            } else if sum > target {
                end -= 1
            } else {
                results.append([num, nums[start], nums[end]])
                start += 1
                end -= 1

                while start < end && nums[start] == nums[start - 1] {
                    start += 1
                }
            }
        }
    }
}