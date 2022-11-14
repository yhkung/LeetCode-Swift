/// 098 Validate Binary Search Tree
/// - Approach: Inorder traversal
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
    func isValidBST(_ root: TreeNode?) -> Bool {
        var stack: [TreeNode?] = []
        var curr: TreeNode? = root
        var prev = Int.min
        while !stack.isEmpty || curr != nil {
            while let node = curr {
                stack.append(node)
                curr = node.left
            }
            let node = stack.removeLast()!
            if node.val <= prev {
                return false
            }
            prev = node.val
            curr = node.right
        }
        return true
    }
}

class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        return isValid(root, Int.min, Int.max)
    }

    func isValid(_ node: TreeNode?, _ lowerBound: Int, _ upperBound: Int) -> Bool {
        guard let node = node else { return true }

        if !(lowerBound < node.val && node.val < upperBound) {
            return false
        }

        let isLeftValid = isValid(node.left, lowerBound, node.val)
        let isRightValid = isValid(node.right, node.val, upperBound)

        return isLeftValid && isRightValid
    }
}

class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {        
        func isValid(_ node: TreeNode?, _ left: Int, _ right: Int) -> Bool {
            guard let node = node else { 
                return true 
            }
            if !(node.val > left && node.val < right) {
                return false
            }
            return isValid(node.left, left, node.val) && isValid(node.right, node.val, right)
        }
        return isValid(root, Int.min, Int.max)
    }
}