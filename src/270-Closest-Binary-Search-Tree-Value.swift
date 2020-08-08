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
class Solution {
    func closestValue(_ root: TreeNode?, _ target: Double) -> Int {
        guard let root = root else {
            fatalError()
        }
        var node: TreeNode? = root
        var closestValue = root.val
        while node != nil {
            let val = node!.val
            if abs(target - Double(val)) < abs(target - Double(closestValue)) {
                closestValue = val
            }
            if target < Double(val) {
                node = node?.left
            } else {
                node = node?.right
            }

        }
        return closestValue
    }
}