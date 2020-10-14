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
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        guard let root = root else {
            return []
        }
        var allPaths = [String]()
        var path = [Int]()
        path.append(root.val)
        findPaths(root, &path, &allPaths)
        return allPaths
    }

    private func findPaths(_ node: TreeNode?, _ path: inout [Int], _ allPaths: inout [String]) {
        guard let node = node else {
            return
        }
        if node.left == nil && node.right == nil {
            let pathString = path.compactMap { "\($0)" }.joined(separator: "->")
            allPaths.append(pathString)
        }

        if let leftNode = node.left {
            path.append(leftNode.val)
            findPaths(leftNode, &path, &allPaths)
            path.removeLast()
        }

        if let rightNode = node.right {
            path.append(rightNode.val)
            findPaths(rightNode, &path, &allPaths)
            path.removeLast()
        }
    }
}