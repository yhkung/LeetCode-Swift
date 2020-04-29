/// 124 - Binary Tree Maximum Path Sum
/// - Link: https://leetcode.com/problems/binary-tree-maximum-path-sum/
/// - Time: O(n), where n is number of nodes, since we visit each node
/// - Space: O(log(n)). We have to keep a recursion stack of the size of the tree height.
/// - Approach: Recursion
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
    var sum: Int = Int.min

    func maxPathSum(_ root: TreeNode?) -> Int {
        dfs(root)
        return sum
    }

    private func dfs(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        let left = max(dfs(root.left), 0)
        let right = max(dfs(root.right), 0)
        let val = left + right + root.val
        sum = max(sum, val)
        return max(left, right) + root.val
    }
}