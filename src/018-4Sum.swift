class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        guard nums.count >= 4 else { return [] }

        var nums = nums.sorted()
        var results = [[Int]]()

        for i in 0..<nums.count - 3 {
            if i > 0 && nums[i] == nums[i - 1] {
                continue
            }

            let first = nums[i]
            findThreeSum(first, target - first, nums, i + 1, &results)
        }

        return results
    }

    private func findThreeSum(_ first: Int, _ target: Int, _ nums: [Int], _ start: Int, _ results: inout [[Int]]) {
        for i in start..<nums.count - 2 {
            if i > start && nums[i] == nums[i - 1] {
                continue
            }

            let second = nums[i]
            findTwoSum(first, second, target - second, nums, i + 1, &results)
        }
    }

    private func findTwoSum(_ first: Int, _ second: Int, _ target: Int, _ nums: [Int], _ start: Int, _ results: inout [[Int]]) {
        var start = start
        var end = nums.count - 1

        while start < end {
            let sum = nums[start] + nums[end]

            if sum < target {
                start += 1
            } else if sum > target {
                end -= 1
            } else {
                results.append([first, second, nums[start], nums[end]])
                start += 1
                end -= 1

                while start < end && start > 0 && nums[start] == nums[start - 1] {
                    start += 1
                }
            }
        }
    }
}