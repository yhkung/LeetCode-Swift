/// 108 - Convert Sorted Array to Binary Search Tree
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
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        guard !nums.isEmpty else { return nil }
        return buildTree(nums, 0, nums.count)
    }

    private func buildTree(_ nums: [Int], _ low: Int, _ high: Int) -> TreeNode? {
        guard low < high else { return nil }
        let mid = low + (high - low) / 2
        let node = TreeNode(nums[mid])
        node.left = buildTree(nums, low, mid)
        node.right = buildTree(nums, mid + 1, high)
        return node
    }
}