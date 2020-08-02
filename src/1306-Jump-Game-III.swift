/// 1306 - Jump Game III
/// - Approach: Recursion
class Solution {
    func canReach(_ arr: [Int], _ start: Int) -> Bool {
        var visited: [Int] = []
        return recursion(arr, start, &visited)
    }

    func recursion(_ arr: [Int], _ i: Int, _ visited: inout [Int]) -> Bool {
        if arr[i] == 0 {
            return true
        }
        var forward = false
        var backward = false
        var next = i + arr[i]

        if next >= 0 && next < arr.count && !visited.contains(next) {
            visited.append(next)
            forward = recursion(arr, next, &visited)
            visited.removeLast()
        }

        next = i - arr[i]
        if next >= 0 && next < arr.count && !visited.contains(next) {
            visited.append(next)
            backward = recursion(arr, next, &visited)
            visited.removeLast()
        }

        return forward || backward
    }
}
