class Solution {
    func reverse(_ x: Int) -> Int {
        var rev = 0
        var value = x
        while value != 0 {
            let pop = value % 10
            value /= 10            
            rev = rev * 10 + pop
            if rev > Int32.max - 1 || rev < Int32.min {
                return 0
            }
        }
        return rev
    }
}