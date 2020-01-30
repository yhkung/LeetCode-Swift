/// 701 - Insert into a Binary Search Tree
/// - Approach: Iteration
/// - Time Complexity: O(H), where H is a tree height
/// - Space Complexity: O(1)
class Solution {
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        var curr: TreeNode? = root
        while let node = curr {
            if val > node.val {
                if node.right == nil {
                    node.right = TreeNode(val)
                    return root
                } else {
                    curr = node.right
                }
            } else {
                if node.left == nil {
                    node.left = TreeNode(val)
                    return root
                } else {
                    curr = node.left
                }
            }
        }
        return root
    }
}