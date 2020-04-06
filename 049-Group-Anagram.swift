/// 049 - Group Anagram
/// - Link: https://leetcode.com/problems/group-anagrams/
/// - Time: O(NK), where N is the length of `strs`, and K is the maximum length of a string in `strs`
class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        return strs.reduce(into: [[Character: Int]: [String]]()) {
            $0[$1.reduce(into: [Character: Int]()) { $0[$1, default: 0] += 1 }, default: []].append($1)
        }.map { $1 }
    }
}