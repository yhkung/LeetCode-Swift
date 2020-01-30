/// 700 - Search in a Binary Search Tree
/// - Approach: Iteration
/// - Time Complexity: O(H), where H is a tree height
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
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        var curr: TreeNode? = root
        while let node = curr {
            if node.val == val {
                return node
            } else if val < node.val {
                curr = node.left
            } else {
                curr = node.right
            }
        }
        return curr
    }
}