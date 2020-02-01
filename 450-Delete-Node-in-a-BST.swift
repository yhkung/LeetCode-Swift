/// 450 - Delete Node in a BST
/// - Approach: Iteration
/// - Time Complexity: O(H)
/// - Space Complexity: O(1)
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
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        guard let root = root else { return nil }
        var pre: TreeNode? = nil
        var cur: TreeNode? = root

        // Find predcessor and node to delete
        while let value = cur?.val, value != key {
            pre = cur
            if key < value {
                cur = cur?.left
            } else {
                cur = cur?.right
            }
        }

        if pre == nil {
            return deleteRootNode(cur)
        }

        if pre?.left?.val == cur?.val {
            pre?.left = deleteRootNode(cur)
        }

        if pre?.right?.val == cur?.val {
            pre?.right = deleteRootNode(cur)
        }

        return root
    }

    private func deleteRootNode(_ root: TreeNode?) -> TreeNode? {
        guard var root = root else { return nil }
        if root.left == nil {
            return root.right
        }
        guard let right = root.right else {
            return root.left
        }
        var next = findMin(right)
        next.left = root.left
        return right
    }

    private func findMin(_ node: TreeNode) -> TreeNode {
        var cur = node
        while let left = cur.left {
            cur = left
        }
        return cur
    }

}