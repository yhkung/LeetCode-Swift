/// 230 - Kth Smallest Element in a BST
/// - Link: https://leetcode.com/problems/kth-smallest-element-in-a-bst/
/// - Time: O(N)
/// - Space: O(N)
class Solution {
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var nodes: [Int] = []
        dfs(root, &nodes)
        print(nodes)
        return nodes[k - 1]
    }

    private func dfs(_ node: TreeNode?, _ nodes: inout [Int]) {
        guard let node = node else { return }
        dfs(node.left, &nodes)
        nodes.append(node.val)
        dfs(node.right, &nodes)
    }
}


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

/// 230 - Kth Smallest Element in a BST
/// - Link: https://leetcode.com/problems/kth-smallest-element-in-a-bst/
/// - Time: O(H + k), H is tree height.
/// - Space: O(H + k), the same as for time complexity, \mathcal{O}(N + k)O(N+k) in the worst case, and \mathcal{O}(\log N + k)O(logN+k) in the average case.

class CountableTreeNode {
    var val: Int
    var left: CountableTreeNode?
    var right: CountableTreeNode?
    var count: Int

    init(_ val: Int, _ left: CountableTreeNode?, _ right: CountableTreeNode?) {
        self.val = val
        self.left = left
        self.right = right
        self.count = 1
    }
}

class Solution {

    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var n = 1
        guard let root = buildCountableTreeNode(root, &n) else { return 0 }
        return kthSmallest(root, k)
    }

    private func buildCountableTreeNode(_ node: TreeNode?, _ count: inout Int) -> CountableTreeNode? {
        guard let node = node else { return nil }
        var root = CountableTreeNode(node.val, nil, nil)
        root.left = buildCountableTreeNode(node.left, &count)
        root.count = count
        count += 1
        root.right = buildCountableTreeNode(node.right, &count)
        return root
    }

    func kthSmallest(_ node: CountableTreeNode?, _ k: Int) -> Int {
        guard let node = node else { return 0 }
        if node.count > k {
            return kthSmallest(node.left, k)
        } else if node.count < k {
            return kthSmallest(node.right, k)
        } else {
            return node.val
        }
        return -1
    }

}