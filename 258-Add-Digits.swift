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