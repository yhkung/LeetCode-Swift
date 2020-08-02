// 202 - Happy Number
// - Link: https://leetcode.com/problems/happy-number/
// - Approcah: HashSet
// - Time: O(logn)
// - Space: O(logn)
class Solution {
    func isHappy(_ n: Int) -> Bool {
        var num = n
        var seen = Set<Int>()
        while num > 1 && !seen.contains(num) {
            seen.insert(num)
            num = sumOfSquare(num)
        }
        return num == 1
    }

    func sumOfSquare(_ n: Int) -> Int {
        var num = n
        var sum = 0
        while num > 0 {
            var digit = num % 10
            sum += digit * digit
            num /= 10
        }
        return sum
    }
}

// - Approcah: Floyd's Cycle-Finding Algorithm
// - Time: O(logn)
// - Space: O(1)
class Solution {
    func isHappy(_ n: Int) -> Bool {
        var slow = n
        var fast = sumOfSquare(n)
        while fast != 1 && slow != fast {
            slow = sumOfSquare(slow)
            fast = sumOfSquare(sumOfSquare(fast))
        }
        return fast == 1
    }

    func sumOfSquare(_ n: Int) -> Int {
        var num = n
        var sum = 0
        while num > 0 {
            var digit = num % 10
            sum += digit * digit
            num /= 10
        }
        return sum
    }
}