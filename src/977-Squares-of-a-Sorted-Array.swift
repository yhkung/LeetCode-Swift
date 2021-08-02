class Solution {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        var results = Array(repeating: 0, count: nums.count)
        var left = 0
        var right = nums.count - 1
        var index = nums.count - 1

        while left <= right {
            let leftValue = nums[left] * nums[left]
            let rightValue = nums[right] * nums[right]
            if leftValue > rightValue {
                results[index] = leftValue
                left += 1
            } else {
                results[index] = rightValue
                right -= 1
            }
            index -= 1
        }

        return results
    }

}