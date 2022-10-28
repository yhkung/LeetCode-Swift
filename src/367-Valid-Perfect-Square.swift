class Solution {
    func isPerfectSquare(_ num: Int) -> Bool {
        var start = 0
        var end = num

        while start + 1 < end {
            let mid = start + (end - start) / 2
            let square = mid * mid
            if square == num {
                return true
            } else if square < num {
                start = mid
            } else if square > num {
                end = mid
            }
        }

        if start * start == num || end * end == num {
            return true
        } else {
            return false
        }        
    }
}