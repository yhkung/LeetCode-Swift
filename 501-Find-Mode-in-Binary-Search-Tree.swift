/// 501 - Find Mode in Binary Search Tree
/// - Approach: Inorder traversal using Recursion
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

    private var maxCount: Int = 0
    private var currCount: Int = 0
    private var currVal: Int = 0

    private var results: [Int] = []

    func findMode(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        currVal = root.val
        inorder(root)
        return results
    }

    func handleValue(_ node: TreeNode?) {
        guard let node = node else { return }
        if node.val != currVal {
            currVal = node.val
            currCount = 0
        }

        currCount += 1

        if currCount > maxCount {
            maxCount = currCount
            results.removeAll()
            results.append(currVal)
        } else if currCount == maxCount {
            results.append(currVal)
        }
    }

    func inorder(_ node: TreeNode?) {
        guard let node = node else { return }
        inorder(node.left)
        handleValue(node)
        inorder(node.right)
    }
}

/// 501 - Find Mode in Binary Search Tree
/// - Approach: Inorder traversal using Iteration
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

    func findMode(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var curr: TreeNode? = root
        var prev: TreeNode? = root
        var stack: [TreeNode] = []

        var results: [Int] = []
        var maxCount: Int = 0
        var currCount: Int = 0
        var currVal: Int = root.val

        while !stack.isEmpty || curr != nil {
            while let node = curr {
                stack.append(node.left)
                curr = node.left
            }

            let node = stack.removeLast()

            if currVal != node.val {
                currVal = node.val
                currCount = 0
            }

            currCount += 1
            if currCount > maxCount {
                results.removeAll()
                maxCount = currCount
                results.append(node.val)
            } else if currCount == maxCount {
                results.append(node.val)
            }

            prev = node
            curr = node.right
        }
    }

}
