
class MinStack {
    private var stack: [Int]
    private var minStack: [(Int, Int)]

    init() {
        stack = []
        minStack = []
    }

    func push(_ x: Int) {
        stack.append(x)
        if minStack.isEmpty {
            minStack.append((x, 1))
        } else if let top = minStack.last {
            if top.0 == x {
                minStack[minStack.count - 1] = (x, top.1 + 1)
            } else if x < top.0 {
                minStack.append((x, 1))
            }
        }
    }

    func pop() {
        if let top = stack.last, let curMin = minStack.last, top == curMin.0 {
            if curMin.1 == 1 {
                minStack.popLast()
            } else {
                minStack[minStack.count - 1] = (curMin.0, curMin.1 - 1)
            }
        }
        stack.popLast()
    }

    func top() -> Int {
        return stack.last ?? -1
    }

    func getMin() -> Int {
        return minStack.last?.0 ?? -1
    }
}