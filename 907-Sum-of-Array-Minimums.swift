/// 907 - Sum of Array Minimums
/// - Link: https://leetcode.com/problems/sum-of-subarray-minimums/
/// - Approach: Stack, finding NLE & PLE
/// - Time Complexity: O(n)
/// - Space Complexity: O(n)
class Solution {
    func sumSubarrayMins(_ A: [Int]) -> Int {
        let n = A.count
        var prevStack: [Int] = []
        var nextStack: [Int] = []
        var left = Array(repeating: -1, count: n)
        var right = Array(repeating: -1, count: n)

        for i in 0..<n {
            left[i] = i + 1
            right[i] = n - i
        }

        for i in 0..<n {
            while let top = prevStack.last, A[top] > A[i] {
                prevStack.removeLast()
            }
            if let last = prevStack.last {
                left[i] = i - last
            } else {
                left[i] = i + 1
            }
            prevStack.append(i)

            while let top = nextStack.last, A[top] > A[i] {
                let prevIndex = nextStack.removeLast()
                right[prevIndex] = i - prevIndex
            }
            nextStack.append(i)
        }

        var sum = 0
        for i in 0..<n {
            sum += A[i] * left[i] * right[i]
        }
        return sum % Int(1e9+7)
    }
}