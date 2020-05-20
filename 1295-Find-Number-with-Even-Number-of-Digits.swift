/// 1295 - Find Numbers with Even Number of Digits
/// - Link: https://leetcode.com/problems/find-numbers-with-even-number-of-digits/
/// - Time: O(n)
/// - Space: O(n)
class Solution {
    func findNumbers(_ nums: [Int]) -> Int {
        var count = 0
        for num in nums {
            if (num >= 10 && num < 100) || (num >= 1000 && num < 10000) {
                count += 1
            }
        }
        return count
    }
}