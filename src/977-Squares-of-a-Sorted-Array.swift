class Solution {
    func sortedSquares(_ A: [Int]) -> [Int] {
        var l = 0
        var r = A.count - 1
        var index = A.count - 1
        var res = Array(repeating: 0, count: A.count)
        while l <= r {
            let leftValue = A[l] * A[l]
            let rightValue = A[r] * A[r]
            if leftValue > rightValue {
                res[index] = leftValue
                l += 1
            } else {
                res[index] = rightValue
                r -= 1
            }
            index -= 1
        }
        return res
    }
}