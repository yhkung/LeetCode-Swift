/// 277 - Find The Celebrity
/// - Link: https://leetcode.com/problems/find-the-celebrity/
/// - Time: O(n)
/// - Space: O(1)
/**
 * The knows API is defined in the parent class Relation.
 *     func knows(_ a: Int, _ b: Int) -> Bool;
 */

class Solution : Relation {
    func findCelebrity(_ n: Int) -> Int {
        var candidate: Int = 0
        for i in 0..<n {
            if knows(candidate, i) {
                candidate = i
            }
        }
        for i in 0..<n {
            if i < candidate && knows(candidate, i) {
                return -1
            }
            if i > candidate && !knows(i, candidate) {
                return -1
            }
        }
        return candidate
    }

}