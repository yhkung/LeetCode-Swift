extension Character {
    var columnValue: Int {
        return Int(self.asciiValue!) - 65 + 1
    }
}
class Solution {
    func titleToNumber(_ s: String) -> Int {
        let s = Array(s)
        var sum = 0
        for i in 0..<s.count {
            sum += Int(Double(s[s.count - 1 - i].columnValue) * pow(26, Double(i)))
        }
        return sum
    }
}