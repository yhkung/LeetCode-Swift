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

// DFS with recursion
// Time: O(n)
 class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {        
        guard let root = root else { return 0 }
        return 1 + max(maxDepth(root.left), maxDepth(root.right))        
    }
}

// DFS with recursion
// Time: O(n)
class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {        
        return depth(root, 0)
    }

    func depth(_ node: TreeNode?, _ depth: Int) -> Int {
        guard let node = node else {
            return depth
        }
        var depth = depth + 1

        let left = self.depth(node.left, depth)
        let right = self.depth(node.right, depth)
        
        return max(left, right)
    }
}

// DFS with iterative
class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        var stack: [(TreeNode?, Int)] = [(root, 1)]
        var result = 0

        while !stack.isEmpty {
            let (node, depth) = stack.removeLast()
            if let node = node {
                result = max(result, depth)
                stack.append((node.left, 1 + depth))
                stack.append((node.right, 1 + depth))
            }
        }

        return result
    }
}

// BFS
// Time: O(n), Space: O(n)
class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var level = 0
        var queue = [root]

        while !queue.isEmpty {
            level += 1
            for i in 0..<queue.count {
                let node = queue.removeFirst()
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }              
            }
        }
        return level
    }
}