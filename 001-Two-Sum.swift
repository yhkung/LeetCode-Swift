class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var map = [Int: Int]()
        for i in 0...nums.count-1 {
            let complement = target - nums[i]
            if map.keys.contains(complement) {
                return [i, map[complement]!]
            }
            map[nums[i]] = i
        }
        return []
    }
}