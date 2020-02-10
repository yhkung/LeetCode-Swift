/// 167 - Two Sum II - Input Array is Sorted
/// - Approach: Two pointer
/// - Time Complexity: O(n)
/// - Space Complexity: O(1)
class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var left = 0
        var right = numbers.count - 1
        while left < right {
            let res = numbers[left] + numbers[right]
            if res == target {
                return [left + 1, right + 1]
            } else if res > target {
                right -= 1
            } else {
                left += 1
            }
        }
        return []
    }
}