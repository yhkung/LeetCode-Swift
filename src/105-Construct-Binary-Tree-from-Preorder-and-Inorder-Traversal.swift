class Solution {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {        
        guard !preorder.isEmpty, !inorder.isEmpty else { return nil }        
        let val = preorder[0]
        let mid = inorder.firstIndex(of: val)!
        var node = TreeNode(val)
        
        node.left = buildTree(
            subarray(preorder, 1, mid + 1),
            subarray(inorder, 0, mid)
        )
        node.right = buildTree(
            subarray(preorder, mid + 1, preorder.count),
            subarray(inorder, mid + 1, inorder.count)
        )
        return node
    }

    private func subarray<T>(_ array: [T], _ low: Int, _ high: Int) -> [T] {
        guard low <= high else { 
            return [] 
        }
        return Array(array[low..<high])
    }
}