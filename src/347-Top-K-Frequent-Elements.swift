class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {        
        var bucket = Array(repeating: [Int](), count: nums.count + 1)

        let numCount = nums.reduce(into: [Int: Int]()) { $0[$1, default: 0] += 1 }

        for (num, count) in numCount {
            bucket[count].append(num)
        }
        
        var result = [Int]()
        for i in (0...nums.count).reversed() {                        
            for n in bucket[i] {
                result.append(n)
                if result.count == k {
                    return result
                }
            }
        }

        return result
    }
}