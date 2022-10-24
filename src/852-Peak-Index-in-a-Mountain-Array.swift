class Solution {
    func peakIndexInMountainArray(_ arr: [Int]) -> Int {
        guard arr.count >= 3 else { 
            return -1
        }

        var start = 0
        var end = arr.count - 1

        while start + 1 < end {
            let mid = start + (end - start) / 2
            if arr[mid] < arr[mid + 1] {
                start = mid
            } else if arr[mid - 1] > arr[mid] {
                end = mid
            } else {
                return mid
            }
        }

        if arr[start] < arr[end] {
            return end
        } else {
            return start
        }
    }
}