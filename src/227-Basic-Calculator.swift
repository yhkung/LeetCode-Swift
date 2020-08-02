class Solution {
    func calculate(_ s: String) -> Int {
        guard !s.isEmpty else { return 0 }
        var s = Array(s)
        var sum = 0
        var num = 0
        var op: Character = "+"
        var stack: [Int] = []
        for i in 0..<s.count {
            if let val = Int("\(s[i])") {
                num = num * 10 + val
            }

            if i == s.count - 1 || "+-*/".contains(s[i]) {
                if op == "*" || op == "/" {
                    sum -= stack.last ?? 0
                }
                switch op {
                case "+": stack.append(num)
                case "-": stack.append(-num)
                case "*": stack.append(stack.removeLast() * num)
                case "/": stack.append(stack.removeLast() / num)
                default: break
                }
                num = 0
                op = s[i]
                sum += stack.last ?? 0
            }
        }
        return sum
    }
}