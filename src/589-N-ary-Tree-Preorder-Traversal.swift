/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var children: [Node]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.children = []
 *     }
 * }
 */

// Recursive

class Solution {
    func preorder(_ root: Node?) -> [Int] {
    	var result = [Int]()
        traversal(root, &result)
        return result
    }

    private func traversal(_ node: Node?, _ result: inout [Int]) {
        guard let node = node else {
            return
        }

        result.append(node.val)
        for child in node.children {
            traversal(child, &result)
        }
    }
}

// Iterative

class Solution {
    func preorder(_ root: Node?) -> [Int] {        
        guard let root = root else { 
            return [] 
        }

        var result = [Int]()
        var queue = [Node]()
        queue.append(root)

        while !queue.isEmpty {
            if let node = queue.popLast() {
                result.append(node.val)
                for i in 0..<node.children.count {
                    queue.append(node.children[node.children.count - 1 - i])
                }
            }
        }

        return result
    }
}