/// 981. Time Based Key-Value Store
/// - Approach: Binary Search
class TimeMap {

    var timestamps = [String: [Int]]()
    var values = [Int: String]()

    init() { }

    func set(_ key: String, _ value: String, _ timestamp: Int) {
        timestamps[key, default: []].append(timestamp)
        values[timestamp] = value
    }

    func get(_ key: String, _ timestamp: Int) -> String {
        guard let arr = timestamps[key] else { return "" }
        guard let first = arr.first, timestamp >= first else { return "" }
        let timekey = binarySearch(arr, timestamp)
        return values[timekey] ?? ""
    }

    private func binarySearch(_ nums: [Int], _ target: Int) -> Int {
        var low = 0
        var high = nums.count - 1
        while low < high {
            let mid = low + (high - low + 1) / 2
            if target == nums[mid] {
                return target
            } else if target < nums[mid] {
                high = mid - 1
            } else {
                low = mid
            }
        }
        return nums[low]
    }
}
