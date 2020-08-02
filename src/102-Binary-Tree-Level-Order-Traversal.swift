/// https://leetcode.com/problems/binary-tree-level-order-traversal/
/// 102. Binary Tree Level Order Traversal
/// - Approach: Iteration
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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var queue: [TreeNode] = [root]
        var results: [[Int]] = []
        while !queue.isEmpty {
            var levels: [Int] = []
            for _ in 0..<queue.count {
                let node = queue.removeFirst()
                levels.append(node.val)
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            results.append(levels)
        }
        return results
    }
}