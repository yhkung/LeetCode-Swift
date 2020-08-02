/// 278 - First Bad Version
/// - Link: https://leetcode.com/problems/first-bad-version/
/// - Time: O(logn)
/// - Space: O(1)
/**
 * The knows API is defined in the parent class VersionControl.
 *     func isBadVersion(_ version: Int) -> Bool{}
 */
class Solution : VersionControl {
    func firstBadVersion(_ n: Int) -> Int {
        var low = 0
        var high = n
        while low < high {
            let mid = low + (high - low) / 2
            if isBadVersion(mid + 1) == false {
                low = mid + 1
            } else {
                high = mid
            }
        }
        return low + 1
    }
}