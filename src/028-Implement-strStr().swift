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