/// 107 - Binary Tree Level Order Traversal II
/// https://leetcode.com/problems/binary-tree-level-order-traversal-ii/
/// - Approach: BFS
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
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var results: [[Int]] = []
        var queue: [TreeNode] = []

        queue.append(root)

        while !queue.isEmpty {
            var nodes: [Int] = []
            for _ in 0..<queue.count {
                let cur = queue.removeFirst()
                nodes.append(cur.val)
                if let left = cur.left {
                    queue.append(left)
                }
                if let right = cur.right {
                    queue.append(right)
                }
            }
            results.append(nodes)
        }

        return results.reversed()
    }
}