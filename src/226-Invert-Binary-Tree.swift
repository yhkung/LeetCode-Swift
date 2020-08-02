/// 226. Invert Binary Tree
/// - Link: https://leetcode.com/problems/invert-binary-tree/
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        // guard let root = root else { return nil }
        // (root.left, root.right) = (invertTree(root.right), invertTree(root.left))
        // return root

        var stack = [root]
        while !stack.isEmpty {
            var node = stack.removeLast()
            if var node = node {
                (node.left, node.right) = (node.right, node.left)
                stack.append(node.left)
                stack.append(node.right)
            }

        }
        return root
    }
}