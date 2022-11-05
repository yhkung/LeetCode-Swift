/// 238 - Product of Array Except Self
/// - Link: https://leetcode.com/problems/product-of-array-except-self/

/// - Approach: ?_?
class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var zeroCount: Int = 0
        var productExceptZero = nums.filter {
            if $0 == 0 {
                zeroCount += 1
                return false
            } else {
                return true
            }
        }.reduce(1) { $0 * $1 }

        if zeroCount > 1 {
            return Array(repeating: 0, count: nums.count)
        }

        var product: [Int] = []
        for n in nums {
            if n == 0 {
                product.append(productExceptZero)
            } else {
                if zeroCount > 0 {
                    product.append(0)
                } else {
                    product.append(productExceptZero / n)
                }
            }
        }
        return product
    }
}

/// - Approach: Left & Right product lists
class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var left = Array(repeating: 0, count: n)
        var right = Array(repeating: 0, count: n)

        for i in 0..<n {
            if i > 0 {
                left[i] = left[i - 1] * nums[i]
            } else {
                left[i] = nums[i]
            }
        }

        for i in (0..<n).reversed() {
            if i == n - 1 {
                right[i] = nums[i]
            } else {
                right[i] = right[i + 1] * nums[i]
            }
        }

        var result = Array(repeating: 0, count: n)
        for i in 0..<n {
            if i == 0 {
                result[i] = right[i + 1]
            } else if i == n - 1 {
                result[i] = left[i - 1]
            } else {
                result[i] = left[i - 1] * right[i + 1]
            }
        }
        
        return result
    }
}

/// - Approach: O(1) space approach
class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        let n = nums.count        
        var result = Array(repeating: 1, count: n)

        var prefix = 1
        for i in 0..<n {
            result[i] = prefix
            prefix *= nums[i]
        }        
        
        var postfix = 1
        for i in (0..<n).reversed() {
            result[i] *= postfix
            postfix *= nums[i]
        }

        return result        
    }
}