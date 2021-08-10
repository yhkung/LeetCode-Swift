class Solution {
    func twoSumLessThanK(_ nums: [Int], _ k: Int) -> Int {
        guard nums.count >= 2 else {
            return -1
        }

        var maximum = -1
        var nums = nums.sorted()
        var left = 0
        var right = nums.count - 1

        while left < right {
            let sum = nums[left] + nums[right]
            if sum < k {
                maximum = max(maximum, sum)
                left += 1
            } else {
                right -= 1
            }
        }

        return maximum
    }
}