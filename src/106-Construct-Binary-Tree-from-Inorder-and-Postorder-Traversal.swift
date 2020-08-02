/// 106 - Construct Binary Tree from Inorder and Postorder Traversal
/// - Link: https://leetcode.com/problems/construct-binary-tree-from-inorder-and-postorder-traversal/
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
    private var inorder: [Int] = []
    private var postorder: [Int] = []
    private var indexDict: [Int: Int] = [:]
    private var postIndex: Int = 0

    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        self.inorder = inorder
        self.postorder = postorder
        self.postIndex = postorder.count - 1
        self.indexDict = inorder.enumerated().reduce(into: [Int: Int]()) { $0[$1.1] = $1.0 }
        return helper(0, postorder.count - 1)
    }

    private func helper(_ leftIndex: Int, _ rightIndex: Int) -> TreeNode? {
        guard leftIndex <= rightIndex else {
            return nil
        }

        let val = postorder[postIndex]
        let root = TreeNode(val)

        let index = indexDict[val]!

        postIndex -= 1
        root.right = helper(index + 1, rightIndex)
        root.left = helper(leftIndex, index - 1)
        return root
    }
}