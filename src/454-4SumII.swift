class Solution {
    func fourSumCount(_ nums1: [Int], _ nums2: [Int], _ nums3: [Int], _ nums4: [Int]) -> Int {
        let sum1 = sum(nums1, nums2)
        let sum2 = sum(nums3, nums4)

        var map = [Int: Int]()
        var numberOfTuples = 0

        for a in nums1 {
            for b in nums2 {
                map[a + b, default: 0] += 1
            }
        }

        for c in nums3 {
            for d in nums4 {
                let sum = -(c + d)
                numberOfTuples += map[sum, default: 0]
            }
        }

        return numberOfTuples
    }
}