/// 173 - Binary Tree Iterator
/// - Link: https://leetcode.com/problems/binary-search-tree-iterator/
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

class BSTIterator {
    private var nums = [Int]()

    private var index = 0

    init(_ root: TreeNode?) {
        dfs(root)
    }

    private func dfs(_ node: TreeNode?) {
        guard let node = node else { return }
        dfs(node.left)
        nums.append(node.val)
        dfs(node.right)
    }

    /** @return the next smallest number */
    func next() -> Int {
        let num = nums[index]
        index += 1
        return num
    }

    /** @return whether we have a next smallest number */
    func hasNext() -> Bool {
        return index < nums.count
    }
}

/**
 * Your BSTIterator object will be instantiated and called as such:
 * let obj = BSTIterator(root)
 * let ret_1: Int = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */