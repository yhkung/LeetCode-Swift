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