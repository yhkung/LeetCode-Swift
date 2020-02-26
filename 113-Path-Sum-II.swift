/// 113 - Path Sum II
/// - Link: https://leetcode.com/problems/path-sum-ii/
/// - Approach: DFS, using Stack
class Solution {
    func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        guard let root = root else { return [] }

        var stack: [(TreeNode?, Int, [Int])] = []
        var paths: [[Int]] = []

        stack.append((root, sum, []))

        while !stack.isEmpty {
            let cur = stack.removeLast()
            let node = cur.0
            let remainingSum = cur.1
            var path = cur.2

            guard let node = node else { continue }

            path.append(node.val)

            if node.val == remainingSum && node.left == nil && node.right == nil {
                paths.append(path)
            } else {
                stack.append((node.left, remainingSum - node.val, path))
                stack.append((node.right, remainingSum - node.val, path))
            }
        }

        return paths
    }
}


/// 113 - Path Sum II
/// - Link: https://leetcode.com/problems/path-sum-ii/
/// - Approach: DFS, Recursion
class Solution {
    func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        guard let root = root else { return [] }
        return pathSum(root, sum, [], [])
    }

    private func pathSum(_ node: TreeNode, _ remainingSum: Int, _ path: [Int], _ paths: [[Int]]) -> [[Int]] {
        var paths = paths
        if node.left == nil && node.right == nil {
            if node.val == remainingSum {
                paths.append(path + [node.val])
                return paths
            } else {
                return paths
            }
        }
        var path = path + [node.val]
        if let left = node.left {
            paths = pathSum(left, remainingSum - node.val, path, paths)
        }
        if let right = node.right {
            paths = pathSum(right, remainingSum - node.val, path, paths)
        }
        return paths
    }
}

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