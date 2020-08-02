/// 901 - Online Stock Span
/// - Link: https://leetcode.com/problems/online-stock-span/
/// - Time: O(Q), where Q is the number of calls to StockSpanner.next. In total, there are Q pushes to the stack, and at most Q pops.
/// - Space: O(Q)
class StockSpanner {

    private var stack = [(Int, Int)]()

    init() {

    }

    func next(_ price: Int) -> Int {
        var res = 1
        while !stack.isEmpty && stack.last!.0 <= price {
            let last = stack.removeLast()
            res += last.1
        }
        stack.append((price, res))
        return res
    }
}

/**
 * Your StockSpanner object will be instantiated and called as such:
 * let obj = StockSpanner()
 * let ret_1: Int = obj.next(price)
 */