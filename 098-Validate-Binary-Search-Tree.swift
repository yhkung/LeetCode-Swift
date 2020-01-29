/// 098 Validate Binary Search Tree
/// - Approach: Inorder traversal
/// - Time Complexity: O(n)
/// - Space Complexity: O(n)
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
    func isValidBST(_ root: TreeNode?) -> Bool {
        var stack: [TreeNode?] = []
        var curr: TreeNode? = root
        var prev = Int.min
        while !stack.isEmpty || curr != nil {
            while let node = curr {
                stack.append(node)
                curr = node.left
            }
            let node = stack.removeLast()!
            if node.val <= prev {
                return false
            }
            prev = node.val
            curr = node.right
        }
        return true
    }
}