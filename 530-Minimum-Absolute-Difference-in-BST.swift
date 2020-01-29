/// 530 Minimum Absolute Difference in BST
/// - Approach: Inorder traversal
/// - Time Complexyti: O(n)
/// - Space Complexyti: O(n)
class Solution {
    func getMinimumDifference(_ root: TreeNode?) -> Int {
        var res = Int.max
        var stack: [TreeNode] = []
        var curr: TreeNode? = root
        var prev: TreeNode? = nil

        while !stack.isEmpty || curr != nil {
            while let node = curr {
                stack.append(node)
                curr = node.left
            }
            let node = stack.removeLast()
            if let prev = prev {
                res = min(res, node.val - prev.val)
            }
            prev = node
            curr = node.right
        }
        return res
    }

}