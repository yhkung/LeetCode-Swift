/// 733 - Flood Fill
/// - Link: https://leetcode.com/problems/flood-fill/
/// - Approach: BFS
/// - Time: O(N), where N is the number of pixels in image. We might process every pixel.
/// - Space: O(N)
class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        var m = image.count
        var n = image.first?.count ?? 0

        if !isValid(sr, sc, m , n) {
            return image
        }

        var image = image
        var todo = [[sr, sc]]
        var color = image[sr][sc]

        if color == newColor {
            return image
        }

        let directions = [(0, 1), (1, 0), (-1, 0), (0, -1)]

        while !todo.isEmpty {
            var cur = todo.removeFirst()
            if image[cur[0]][cur[1]] != color {
                continue
            }

            image[cur[0]][cur[1]] = newColor

            for dir in directions {
                let next = [cur[0] + dir.0, cur[1] + dir.1]
                if isValid(next[0], next[1], m, n) {
                    todo.append(next)
                }
            }
        }
        return image
    }

    private func isValid(_ r: Int, _ c: Int, _ m: Int, _ n: Int) -> Bool {
        return r >= 0 && r < m && c >= 0 && c < n
    }
}

/// - Approach: DFS
/// - Time: O(N), where N is the number of pixels in image. We might process every pixel.
/// - Space: O(N)
class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        var image = image
        dfs(&image, sr, sc, image[sr][sc], newColor)
        return image
    }

    private func dfs(_ image: inout [[Int]], _ r: Int, _ c: Int, _ targetColor: Int, _ newColor: Int) {
        if r < 0 || r >= image.count || c < 0 || c >= (image.first?.count ?? 0) {
            return
        }
        if image[r][c] != targetColor || image[r][c] == newColor {
            return
        }
        image[r][c] = newColor
        let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]
        for dir in directions {
            dfs(&image, r + dir.0, c + dir.1, targetColor, newColor)
        }
    }
}