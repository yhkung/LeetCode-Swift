class Solution {
    func detectCapitalUse(_ word: String) -> Bool {
        guard word.count > 1 else {
            return true
        }
        let word = Array(word)

        if word[0].isLowercase && word[1].isUppercase {
            return false
        }

        // All Uppercase
        if word[0].isUppercase && word[1].isUppercase {
            for i in 2..<word.count {
                if word[i].isLowercase {
                    return false
                }
            }
            return true
        }

        // Capital
        if word[0].isUppercase && word[1].isLowercase {
            for i in 2..<word.count {
                if word[i].isUppercase {
                    return false
                }
            }
            return true
        }

        // All Lowercase
        if word[0].isLowercase && word[1].isLowercase {
            for i in 2..<word.count {
                if word[i].isUppercase {
                    return false
                }
            }
            return true
        }


        return true
    }
}