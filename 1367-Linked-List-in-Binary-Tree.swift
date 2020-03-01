/// 1367 - Linked List in Binary Tree
/// - Link: https://leetcode.com/problems/linked-list-in-binary-tree/
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
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
    func isSubPath(_ head: ListNode?, _ root: TreeNode?) -> Bool {
        if head == nil { return true }
        if root == nil { return false }
        return dfs(head, root) || isSubPath(head, root?.left) || isSubPath(head, root?.right)
    }

    private func dfs(_ head: ListNode?, _ root: TreeNode?) -> Bool {
        if head == nil { return true }
        if root == nil { return false }
        return head?.val == root?.val && (dfs(head?.next, root?.left) || dfs(head?.next, root?.right))
    }
}