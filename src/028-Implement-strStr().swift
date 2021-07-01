/// Implement strStr()
/// Solution: Brute Force
/// Time Complexity: O(n * m), where n is the length of `haystack`, m is the length of the `needle`
class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard !needle.isEmpty else {
            return 0
        }
        guard !haystack.isEmpty else {
            return -1
        }
        guard needle.count <= haystack.count else {
            return -1
        }

        let source = Array(haystack)
        let target = Array(needle)

        for i in 0..<source.count - target.count + 1 {
            var find = 0
            for k in 0..<target.count {
                if source[i + k] == target[k] {
                    find += 1
                }
            }
            if find == target.count {
                return i
            }
        }

        return -1
    }
}

/// Implement strStr()
/// Solution: Has Function
/// Time Complexity: O(n + m), where n is the length of `haystack`, m is the length of the `needle`

class Solution {
    private let BASE = 1000000
    private let POWER_BASE = 31

    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard !needle.isEmpty else {
            return 0
        }
        guard !haystack.isEmpty else {
            return -1
        }
        guard needle.count <= haystack.count else {
            return -1
        }

        let source = Array(haystack)
        let target = Array(needle)

        var m = target.count

        var power = 1
        for i in 0..<m {
            power = power * POWER_BASE % BASE
        }

        var targetHashCode = hashCode(from: target)

        var hashCode = 0

        for i in 0..<source.count {
            guard let nextAsciiValue = source[i].asciiValue else { continue }

            hashCode = (hashCode * POWER_BASE + Int(nextAsciiValue)) % BASE

            if i - m >= 0 {
                guard let previousAsciiValue = source[i - m].asciiValue else { continue }

                hashCode = (hashCode - Int(previousAsciiValue) * power) % BASE
                if hashCode < 0 {
                    hashCode += BASE
                }
            }

            if hashCode == targetHashCode {
                let start = i - m + 1
                let end = i + 1

                guard start >= 0 else { continue }

                if Array(source[start..<end]) == target {
                    return start
                }
            }
        }

        return -1
    }

    private func hashCode(from charArray: [Character]) {
        var hashCode = 0
        for i in 0..<charArray.count {
            guard let asciiValue = charArray[i].asciiValue else { continue }
            hashCode = (hashCode * POWER_BASE) % BASE + Int(asciiValue) % BASE
        }
        return hashCode
    }
}