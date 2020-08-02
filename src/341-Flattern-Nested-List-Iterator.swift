/// 341. Flattern Nested List Iterator
/// Approach: Recursion
class NestedIterator {

    private var list = [Int]()
    private var index: Int = -1
    init(_ nestedList: [NestedInteger]) {
        recursion(nestedList)
    }

    private func recursion(_ nestedList: [NestedInteger]) {
        for ni in nestedList {
            if ni.isInteger() {
                list.append(ni.getInteger())
            } else {
                recursion(ni.getList())
            }
        }
    }

    func next() -> Int {
        if hasNext() {
            index += 1
            return list[index]
        } else {
            return -1
        }
    }

    func hasNext() -> Bool {
        return index < list.count - 1
    }
}

/// 341. Flattern Nested List Iterator
/// Approach: Stack
class NestedIterator {

    private var stack: [NestedInteger] = [NestedInteger]()

    init(_ nestedList: [NestedInteger]) {
        stack = nestedList.reversed()
    }

    func next() -> Int {
        return stack.removeLast().getInteger()
    }

    func hasNext() -> Bool {
        while let last = stack.last {
            if last.isInteger() {
                return true
            } else {
                let list = stack.removeLast().getList()
                for nestedInteger in list {
                    stack.append(nestedInteger)
                }
            }
        }
        return false
    }
}