/// 150. Evaluate Reverse Polish Notation
/// - Time Complexity: O(n)
/// - Space Complexity: O(n)
class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var stack: [Int] = []
        var cur: Int = 0
        for t in tokens {
            if let n = Int(t) {
                stack.append(n)
            } else {
                let n2 = stack.popLast()!
                let n1 = stack.popLast()!
                stack.append(eval(t, n1, n2))
            }
        }
        return stack.popLast()!
    }

    private func eval(_ op: String, _ n1: Int, _ n2: Int) -> Int {
        switch op {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "*":
                return n1 * n2
            case "/":
                return n1 / n2
            default:
                return 0
        }
    }
}