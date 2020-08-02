/// 1346 - Check If N and Its Double Exist
/// - Approach: HashTable
/// - Time Complexity: O(n)
/// - Space Complexity: O(n)
class Solution {
    func checkIfExist(_ arr: [Int]) -> Bool {
        var dict: [Int: Int] = [:]
        for i in 0..<arr.count {
            dict[arr[i]] = i
        }
        for i in 0..<arr.count {
            if let j = dict[arr[i] * 2], i != j {
                return true
            }
        }
        return false
    }
}