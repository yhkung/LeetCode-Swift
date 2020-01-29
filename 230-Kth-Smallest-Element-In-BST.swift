/// 230 Kth Smallest Element in BST
/// - Approach: Inorder traversal
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
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var n: Int = 0
        var stack: [TreeNode] = []
        var curr: TreeNode? = root

        while !stack.isEmpty || curr != nil {
            while let node = curr {
                stack.append(node)
                curr = node.left
            }
            let node = stack.removeLast()
            n += 1
            if n == k {
                return node.val
            }
            curr = node.right
        }
        return 0
    }
}