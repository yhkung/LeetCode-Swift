/// 079 - Word Search
/// - Link: https://leetcode.com/problems/word-search/
/// - Approach: Backtracking
/// - Time Complexity: O(N．3^L), where N is the number of cells in the board and L is the length of the word to be matched.
/// - Space Complexity: O(L) where L is the length of the word to be matched
class Solution {
    private let directions = [(1, 0), (0, 1), (-1, 0), (0, -1)]

    func exist(_ board: [[Character]], _ word: String) -> Bool {
        var board = board
        let word = Array(word)
        for i in 0..<board.count {
            for j in 0..<board[0].count {
                if backtrack(&board, word, 0, i, j) {
                    return true
                }
            }
        }
        return false
    }

    private func backtrack(_ board: inout [[Character]], _ word: [Character], _ index: Int, _ i: Int, _ j: Int) -> Bool {
        if board[i][j] != word[index] {
            return false
        }
        if index >= word.count - 1 {
            return true
        }

        board[i][j] = "#"
        for direction in directions {
            var i = i + direction.0
            var j = j + direction.1
            if i >= 0 && i < board.count && j >= 0 && j < board[0].count {
                if backtrack(&board, word, index + 1, i, j) {
                    return true
                }
            }
        }
        board[i][j] = word[index]
        return false
    }

}