/// 167 - Two Sum II - Input Array is Sorted
/// - Approach: Two pointer
/// - Time Complexity: O(n)
/// - Space Complexity: O(1)
class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        guard !numbers.isEmpty else {
            return []
        }

        var left = 0
        var right = numbers.count - 1

        while left < right {
            let sum = numbers[left] + numbers[right]

            if sum == target {
                return [left + 1, right + 1]
            } else if sum > target {
                right -= 1
            } else if sum < target{
                left += 1
            }
        }

        return []
    }
}