/// 113 - Path Sum II
/// - Link: https://leetcode.com/problems/path-sum-ii/
/// - Approach: BFS
class Solution {
    func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        guard let root = root else { return [] }
        var results: [[Int]] = []
        var queue: [(TreeNode, Int, [Int])] = []

        queue.append((root, root.val, [root.val]))

        while !queue.isEmpty {
            let cur = queue.removeFirst()
            if cur.1 == sum && cur.0.left == nil && cur.0.right == nil {
                results.append(cur.2)
            } else {
                if let left = cur.0.left {
                    queue.append((left, cur.1 + left.val, cur.2 + [left.val]))
                }
                if let right = cur.0.right {
                    queue.append((right, cur.1 + right.val, cur.2 + [right.val]))
                }
            }
        }
        return results
    }
}