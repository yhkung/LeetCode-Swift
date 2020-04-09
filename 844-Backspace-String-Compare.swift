class Solution {
    func backspaceCompare(_ S: String, _ T: String) -> Bool {
        var s = Array(S)
        var t = Array(T)
        var i = s.count - 1
        var j = t.count - 1

        var skipCountOfS = 0
        var skipCountOfT = 0

        while i >= 0 || j >= 0 {
            while i >= 0 {
                if s[i] == "#" {
                    skipCountOfS += 1
                    i -= 1
                } else if skipCountOfS > 0 {
                    skipCountOfS -= 1
                    i -= 1
                } else {
                    break
                }
            }

            while j >= 0 {
                if t[j] == "#" {
                    skipCountOfT += 1
                    j -= 1
                } else if skipCountOfT > 0 {
                    skipCountOfT -= 1
                    j -= 1
                } else {
                    break
                }
            }

            if i >= 0 && j >= 0 && s[i] != t[j] {
                return false
            }

            if (i >= 0) != (j >= 0) {
                return false
            }

            i -= 1
            j -= 1
        }
        return true
    }
}