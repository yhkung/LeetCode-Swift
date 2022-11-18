/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var neighbors: [Node?]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.neighbors = []
 *     }
 * }
 */

class Solution {
    func cloneGraph(_ node: Node?) -> Node? {
        guard let node = node else { return nil }

        var map = [Int: Node?]()

        func dfs(_ node: Node?) -> Node? {
            guard let node = node else { return nil }
            
            if let oldNode = map[node.val] {
                return oldNode
            }
            var copy = Node(node.val)
            map[node.val] = copy
            for nei in node.neighbors {
                copy.neighbors.append(dfs(nei))
            }
            return copy
        }

        return dfs(node)
    }
}

/// dfs(1)
/// copy = Node(1)
/// map {1, 2}
///
/// nei = 2
///
/// dfs(2)
/// nei = 1
/// found oldNode in the map, return old node
/// copy(2).neighbords = {1}
//  nei = 3
/// copy = Node(3)
/// 
