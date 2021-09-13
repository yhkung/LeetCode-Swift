class Solution {
    func sortArrayByParityII(_ nums: [Int]) -> [Int] {
        var nums = nums
        sortByParity(&nums)
        return nums
    }

    private func sortByParity(_ nums: inout [Int]) {
        var i = 0
        var j = 1

        while i < nums.count {
            if nums[i] % 2 == 0 {
                i += 2
                continue
            }

            while nums[j] % 2 == 1 {
                j += 2
            }

            nums.swapAt(i, j)
        }
    }
}