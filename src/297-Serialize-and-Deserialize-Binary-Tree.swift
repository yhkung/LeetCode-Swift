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

class Codec {
    func serialize(_ root: TreeNode?) -> String {
        var res = [String]()
        
        func dfs(_ root: TreeNode?) {
            guard let root = root else {
                res.append("N")
                return
            }
            res.append(String(root.val))
            dfs(root.left)
            dfs(root.right)
        }
        dfs(root)
        return res.joined(separator: ",")
    }
    
    func deserialize(_ data: String) -> TreeNode? {                
        let vals = data.components(separatedBy: ",")
        var i = 0

        func dfs() -> TreeNode? {
            if vals[i] == "N" {
                i += 1
                return nil
            }
            let val = Int(String(vals[i]))!
            let node = TreeNode(val)
            i += 1
            node.left = dfs()
            node.right = dfs()
            return node
        }

        return dfs()
    }
}

// Your Codec object will be instantiated and called as such:
// var ser = Codec()
// var deser = Codec()
// deser.deserialize(ser.serialize(root))