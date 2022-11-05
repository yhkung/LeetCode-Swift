/// 015 - Three Sum
/// - Approach: Two Pointers
/// - Time Complexity: O(n^2)
class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {        
        var nums = nums.sorted()
        var result = [[Int]]()

        for i in 0..<nums.count {
            if i > 0 && nums[i] == nums[i - 1] {
                continue
            }
            findTwoSums(nums, nums[i], i + 1, nums.count - 1, &result)
        }

        return result
    }

    private func findTwoSums(_ nums: [Int], _ num: Int, _ start: Int, _ end: Int, _ result: inout [[Int]]) {
        let target = -num
        var start = start
        var end = end
        while start < end {
            let sum = nums[start] + nums[end]
            if sum < target {
                start += 1
            } else if sum > target {
                end -= 1
            } else {
                result.append([num, nums[start], nums[end]])
                start += 1
                end -= 1
                while start < end && nums[start] == nums[start - 1] {
                    start += 1
                }
            }
        }
    }
}