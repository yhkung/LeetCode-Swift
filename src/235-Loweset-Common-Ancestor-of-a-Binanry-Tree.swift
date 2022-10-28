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
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let p = p, let q = q else { 
            return nil 
        }
        
        var curr: TreeNode? = root

        while curr != nil {
            let currVal = curr!.val
            if currVal < p.val && currVal < q.val {
                curr = curr?.right
            } else if currVal > p.val && currVal > q.val {
                curr = curr?.left
            } else {
                return curr
            }
        }

        return curr        
    }
}