/// 099 Recover Binary Search Tree
/// - Approach: Iterative Inorder Traversal
/// - Time Complexity: O(n)
/// - Space Complexity: O(H), to keep the stack where H is a tree height
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class Solution {
    func recoverTree(_ root: TreeNode?) {
        var stack: [TreeNode] = []
        var curr: TreeNode? = root
        var prev: TreeNode? = nil

        var swapNode1: TreeNode? = nil
        var swapNode2: TreeNode? = nil

        while !stack.isEmpty || curr != nil {
            while let node = curr {
                stack.append(node)
                curr = node.left
            }

            let node = stack.removeLast()

            if let prev = prev, node.val < prev.val {
                swapNode2 = node
                if swapNode1 == nil {
                    swapNode1 = prev
                } else {
                    break
                }
            }
            prev = node
            curr = node.right
        }

        if let node1 = swapNode1, let node2 = swapNode2 {
            var tmp = node1.val
            node1.val = node2.val
            node2.val = tmp
        }
    }
}