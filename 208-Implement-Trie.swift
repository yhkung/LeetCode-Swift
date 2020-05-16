/// 208 - Implement Trie
/// - Link: https://leetcode.com/problems/implement-trie-prefix-tree/
class Trie {

    class TrieNode {
        var children = [Character: TrieNode]()
        var isLast = false
    }

    private var root = TrieNode()

    /** Inserts a word into the trie. */
    /// Time: O(m), where m is the key length
    /// Space: O(m), in the worst case newly inserted key doesn't share a prefix with the keys already inserted in the trie.
    /// We have to add m new nodes, which takes us O(m) space
    func insert(_ word: String) {
        var cur = root

        for char in word {
            if let node = cur.children[char] {
                cur = node
            } else {
                let newNode = TrieNode()
                cur.children[char] = newNode
                cur = newNode
            }
        }

        cur.isLast = true
    }

    /** Returns if the word is in the trie. */
    /// Time: O(m), in each step of the algorithm we search for the next key character. In the worst case the algorithm perform m operations.
    /// Space: O(1)
    func search(_ word: String) -> Bool {
        var cur = root
        for char in word {
            if let node = cur.children[char] {
                cur = node
            } else {
                return false
            }
        }
        return cur.isLast
    }

    /** Returns if there is any word in the trie that starts with the given prefix. */
    /// Time: O(m), in each step of the algorithm we search for the next key character. In the worst case the algorithm perform m operations.
    /// Space: O(1)
    func startsWith(_ prefix: String) -> Bool {
        var cur = root
        for char in prefix {
            if let node = cur.children[char] {
                cur = node
            } else {
                return false
            }
        }
        return cur.isLast || !cur.children.isEmpty
    }
}

/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */