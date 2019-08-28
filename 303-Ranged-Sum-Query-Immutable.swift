
/// Approach #1 - Brute Force
class NumArray {        
    var nums: [[Int]]
    
    init(_ nums: [Int]) {
        self.nums = nums
    }
    
    func sumRange(_ i: Int, _ j: Int) -> Int {
        var sum = 0
        for k in i...j {
            sum += nums[k]
        }
        return sum
    }
}


/// Approach #2 - Caching
class NumArray {    
    
    var cache: [[Int]]
    
    init(_ nums: [Int]) {
        cache = Array(repeating: Array(repeating: 0, count: nums.count), count: nums.count)
        for i in 0..<nums.count {
            var prev = nums[i]            
            for j in i..<nums.count {
                if j == i {
                    cache[i][j] = nums[j]
                } else {
                    prev += nums[j]
                    cache[i][j] = prev   
                }                
            }
        }
    }
    
    func sumRange(_ i: Int, _ j: Int) -> Int {
        return cache[i][j]
    }
}

/// Approach #3 - Caching with DP
class NumArray {    
    var sum: [Int]    
    init(_ nums: [Int]) {
        sum = Array(repeating: 0, count: nums.count)
        for i in 0..<nums.count {            
            sum[i] = (i == 0) ? nums[i] : sum[i-1] + nums[i]
        }
    }    
    func sumRange(_ i: Int, _ j: Int) -> Int {
        return (i == 0) ? sum[j] : sum[j] - sum[i-1]
    }
}
