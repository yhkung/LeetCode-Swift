/// 111. Minimum Depth of Binary Tree
/// https://leetcode.com/problems/minimum-depth-of-binary-tree/
/// Time Complexity: O(n), where n is number of total nodes (worst)
/// Space Complexity: O(n)
class Solution {
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }

        var depth = 0

        var queue = [TreeNode]()
        queue.append(root)

        while !queue.isEmpty {
            depth += 1

            let n = queue.count
            for i in 0..<n {
                let cur = queue.removeFirst()

                if cur.left == nil && cur.right == nil {
                    return depth
                }

                if let left = cur.left {
                    queue.append(left)
                }
                if let right = cur.right {
                    queue.append(right)
                }
            }
        }

        return depth
    }
}