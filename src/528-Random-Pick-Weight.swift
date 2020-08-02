/// 528. Random Pick with Weight
/// - Link: https://leetcode.com/problems/random-pick-with-weight/
/// - Time Complexity: O(n)
class Solution {
    var prefixSum = [Int]()

    init(_ w: [Int]) {
        guard !w.isEmpty else { return }
        prefixSum.append(w[0])
        for i in 1..<w.count {
            prefixSum.append(prefixSum[i - 1] + w[i])
        }
    }

    func pickIndex() -> Int {
        let rn = Int.random(in: 1...prefixSum[prefixSum.count - 1])
        return binarySearch(prefixSum, rn)
    }

    private func binarySearch(_ nums: [Int], _ target: Int) -> Int {
        var low = 0
        var high = nums.count
        while low < high {
            let mid = low + (high - low) / 2
            if target > nums[mid] {
                low = mid + 1
            } else {
                high = mid
            }
        }
        return low
    }

}

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(w)
 * let ret_1: Int = obj.pickIndex()
 */

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(w)
 * let ret_1: Int = obj.pickIndex()
 */