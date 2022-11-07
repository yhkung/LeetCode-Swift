class Solution {
    func isValid(_ s: String) -> Bool {
        let s = Array(s)
        var stack = [Character]()

        let map: [Character: Character] = [
            "(": ")",
            "[": "]",
            "{": "}"
        ]

        for i in 0..<s.count {
            if isOpenBracket(s[i]) {
                stack.append(s[i])
            } else if isClosedBracket(s[i]) {
                guard let last = stack.last else { return false }
                if map[last] != s[i] {
                    return false
                } else {
                    stack.removeLast()
                }
            } else {
                return false
            }
        }

        return stack.isEmpty
    }

    private func isOpenBracket(_ char: Character) -> Bool {
        return char == "(" || char == "[" || char == "{"
    }

    private func isClosedBracket(_ char: Character) -> Bool {
        return char == ")" || char == "]" || char == "}"
    }
}

class Solution {
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()

        var charMap: [Character: Character] = [
            "}": "{",
            "]": "[",
            ")": "("
        ]

        for c in s {
            if c == ")" || c == "]" || c == "}" {
                if let last = stack.last, last == charMap[c, default: Character("")] {
                    stack.removeLast()
                } else {
                    return false
                }
            } else {
                stack.append(c)
            }            
        }

        return stack.isEmpty
    }
}