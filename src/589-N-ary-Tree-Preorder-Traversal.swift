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