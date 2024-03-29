/// 049 - Group Anagrams
/// - Link: https://leetcode.com/problems/group-anagrams/
/// - Time: O(NK), where N is the length of `strs`, and K is the maximum length of a string in `strs`
class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var anagrams = [[Character: Int]: [String]]()
        for str in strs {
            var characterCount = [Character: Int]()
            for char in str {
                characterCount[char, default: 0] += 1
            }
            anagrams[characterCount, default: []].append(str)
        }

        var answers = [[String]]()
        for (_, value) in anagrams {
            answers.append(value)
        }
        return answers
    }
}

/// Short version
class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        return strs.reduce(into: [[Character: Int]: [String]]()) {
            $0[$1.reduce(into: [Character: Int]()) { $0[$1, default: 0] += 1 }, default: []].append($1)
        }.map { $1 }
    }
}

class Solution {
    typealias Anagram = [Character: Int]

    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var anagramDict: [Anagram: [String]] = [:]

        for str in strs {
            let anagram = anagramFromString(str)
            anagramDict[anagram, default: []].append(str)
        }

        var results = [[String]]()
        for (_, strs) in anagramDict {
            results.append(strs)
        }

        return results
    }

    private func anagramFromString(_ str: String) -> Anagram {
        var anagram = [Character: Int]()

        for character in str {
            anagram[character, default: 0] += 1
        }

        return anagram
    }
}