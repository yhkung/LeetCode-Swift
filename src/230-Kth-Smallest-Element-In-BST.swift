/// 230 Kth Smallest Element in BST
/// - Approach: Inorder traversal
/// - Time Complexyti: O(n)
/// - Space Complexyti: O(n)
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

 /// Iterative
class Solution {
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var stack = [TreeNode]()
        var cur = root
        var n = 0            
        while cur != nil || !stack.isEmpty {            
            while cur != nil {
                stack.append(cur)
                cur = cur?.left
            }                        
            let node = stack.removeLast()            
            n += 1                        
            if n == k {
                return node!.val
            }
            cur = cur?.right
        }

        return -1
    }
}

/// Recursive
class Solution {
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        guard root != nil, k >= 0 else { 
            return -1 
        }
        var arr = [Int]()
        inorder(root, &arr)
        return arr[k - 1]        
    }

    private func inorder(_ node: TreeNode?, _ arr: inout [Int]) {
        guard let node = node else { return }
        inorder(node.left, &arr)
        arr.append(node.val)
        inorder(node.right, &arr)
    }
}