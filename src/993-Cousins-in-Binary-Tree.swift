/// 993 - Cousins in Binary Tree
/// - Link: https://leetcode.com/problems/cousins-in-binary-tree/
/// - Approach: Breadth-First Search
/// - Time: O(n)
/// - Space: O(n)
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
    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
        var queue: [TreeNode?] = [root]
        var parentX: Int? = nil
        var parentY: Int? = nil

        while !queue.isEmpty {
            for _ in 0..<queue.count {
                var cur = queue.removeFirst()
                if let left = cur?.left {
                    if left.val == x {
                        parentX = cur?.val
                    } else if left.val == y {
                        parentY = cur?.val
                    }
                    queue.append(left)
                }
                if let right = cur?.right {
                    if right.val == x {
                        parentX = cur?.val
                    } else if right.val == y {
                        parentY = cur?.val
                    }
                    queue.append(right)
                }
            }
            if (parentX == nil && parentY != nil) || (parentX != nil && parentY == nil) {
                return false
            }
            if let pX = parentX, let pY = parentY, pX != pY {
                return true
            }
        }
        return false
    }
}