class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        guard !s.isEmpty else { return true }
	    let sArr = s.map { String($0) }
        let tArr = t.map { String($0) }
        var i = 0
        var j = 0
        while j < tArr.count {
            if sArr[i] == tArr[j] {
                i += 1
            }
            j += 1
            if i == sArr.count { return true }
        }
        return false
    }
}