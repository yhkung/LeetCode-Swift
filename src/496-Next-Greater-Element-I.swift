/// 496. Next Greater Element I
/// Approach #1 - Brute Force
/// - Time Complexity: O(m*n)
/// - Space Complexity: O(m)
func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var res = Array(repeating: -1, count: nums1.count)
    for (i, num1) in nums1.enumerated() {
        var found = false
        for num2 in nums2 {
            if found && num2 > num1 {
                res[i] = num2
                break
            }
            if num2 == num1 {
                found = true
            }
        }
    }
    return res
}

/// 496. Next Greater Element I
/// Approach #2 - Using stack
/// - Time Complexity: O(m + n)
/// - Space Complexity: O(m + n)
class Solution {
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var stack = [Int]()
        var res = Array(repeating: -1, count: nums1.count)
        var map = [Int: Int]()        
        for num2 in nums2 {
            while !stack.isEmpty && num2 > stack.last! {
                map[stack.popLast()!] = num2
            }            
            stack.append(num2)
        }
        while !stack.isEmpty {
            map[stack.popLast()!] = -1
        }
        for (i, num) in nums1.enumerated() {
            res[i] = map[num]!
        }
        return res
    }
}