/// https://leetcode.com/problems/path-sum/
/// 112 - Path Sum
/// - Approach: Recursion
/// - Time Complexity: O(n), where n is the number of nodes
/// - Space Complexity: Worst Case O(n), where n is the height of tree, the storage to keep call stack
/// - Space Complexity: Best Case O(logn), where n is the height of tree, the storage to keep call stack
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
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        guard let root = root else { return false }
        var sum = sum - root.val
        if root.left == nil && root.right == nil {
            return sum == 0
        } else {
            return hasPathSum(root.left, sum) || hasPathSum(root.right, sum)
        }
    }
}

/// 112 - Path Sum
/// - Approach: Iteration
/// - Time Complexity: O(n), where n is the number of nodes
/// - Space Complexity: Worst Case O(n), where n is the height of tree, the storage to keep call stack
class Solution {
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        guard let root = root else { return false }

        var stack: [(TreeNode, Int)] = []
        stack.append((root, sum - root.val))

        while !stack.isEmpty {
            let curr = stack.removeLast()
            let node = curr.0
            let curSum = curr.1
            if node.left == nil && node.right == nil && curSum == 0 {
                return true
            }
            if let left = node.left {
                stack.append((left, curSum - left.val))
            }
            if let right = node.right {
                stack.append((right, curSum - right.val))
            }
        }
        return false
    }
}