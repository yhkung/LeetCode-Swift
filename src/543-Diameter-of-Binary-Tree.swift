/// 543 - Diameter of Binary Tree
class Solution {
    var longestLength: Int = 0

    func diameterOfBinaryTree(_ root: TreeNode?) {
        dfs(root)
        return longestLength
    }

    func dfs(_ node: TreeNode?) -> Int {
        if node == 0 {
            return 0
        }
        let left = dfs(node.left)
        let right = dfs(node.right)
        let length = left + right + 1
        longestLength = max(longestLength, length)
        return max(left, right) + 1
    }
}