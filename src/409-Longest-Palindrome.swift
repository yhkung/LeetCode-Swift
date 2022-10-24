class Solution {
    func longestPalindrome(_ s: String) -> Int {
        guard s.count > 1 else {
            return s.count
        }
        // 1. Create a Dictaionary that contains count of Character 
        //      ["a": 2, "b": 4]
        // 2. We can create palindrome from the `even`` numebr of the characters, and at least one `odd` number for 1 character.
        
        var charCounts = Array(s).reduce(into: [Character: Int]()) { result, nextCharacter in
            result[nextCharacter, default: 0] += 1 
        }

        var maximumLength = 0
        var hasOddCountCharacter = false
        for (_, value) in charCounts {            
            maximumLength += value
            if value % 2 != 0 {
                maximumLength -= 1
                hasOddCountCharacter = true
            }
        }
        
        return hasOddCountCharacter ? maximumLength + 1 : maximumLength
    }
}

class Solution {
    func longestPalindrome(_ s: String) -> Int {
        guard s.count > 1 else {
            return s.count
        }
        
        let s = Array(s)     
        var chars = Set<Character>()

        var maximumLength = 0
        
        for i in 0..<s.count {
            let char = s[i]
            if chars.contains(char) {
                chars.remove(char)
                maximumLength += 2
            } else {
                chars.insert(char)
            }            
        }
        if !chars.isEmpty {
            maximumLength += 1
        }

        return maximumLength
    }
}