/// 258 - Add Digits
/// - Link: https://leetcode.com/problems/add-digits/
/// - Approach: Recursion
class Solution {
    func addDigits(_ num: Int) -> Int {
        var n = num
        while n >= 10 {
            n = addDigit(n)
        }
        return n
    }

    func addDigit(_ n: Int) -> Int {
        var n = n
        var sum = 0
        while n > 0 {
            let digit = n % 10
            sum += digit
            n /= 10
        }
        return sum
    }
}

/// - Approach: Math
/// - Ref: https://en.wikipedia.org/wiki/Digital_root#Congruence_formula
class Solution {
    func addDigits(_ num: Int) -> Int {
        return 1 + (num - 1) % 9
    }
}