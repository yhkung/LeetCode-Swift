/// 094 Binary Tree Inorder Traversal
/// - Time Complexyti: O(n)
/// - Space Complexyti: O(n)
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
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var stack: [TreeNode] = []
        var res: [Int] = []
        var curr: TreeNode? = root

        while !stack.isEmpty || curr != nil {
            while let node = curr {
                stack.append(node)
                curr = node.left
            }
            let node = stack.removeLast()
            res.append(node.val)
            curr = node.right
        }
        return res
    }
}