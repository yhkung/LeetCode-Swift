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
        var n = nums.count
        var left: [Int] = Array(repeating: 1, count: n)
        var right: [Int] = Array(repeating: 1, count: n)
        for i in 1..<n {
            left[i] = left[i - 1] * nums[i]
        }
        for i in stride(from: n - 2, through: 0, by: -1) {
            right[i] = right[i + 1] * nums[i + 1]
        }
        var product: [Int] = []
        for i in 0..<n {
            product = left[i] * right[i]
        }
        return product
    }
}

/// - Approach: O(1) space approach
class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var n = nums.count
        var products: [Int] = Array(repeating: 1, count: n)
        for i in 1..<n {
            products[i] = products[i - 1] * nums[i - 1]
        }

        var r = 1
        for i in stride(from: n - 1, through: 0, by: -1) {
            products[i] = products[i] * r
            r *= nums[i]
        }
        return products
    }
}