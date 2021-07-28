/// 702. Search in a Sorted Array of Unknown Size
/// https://leetcode.com/problems/search-in-a-sorted-array-of-unknown-size/
/// Approach: Binary Search (Exponential Backoff)
/// Approach: O(logn)
class Solution {
    func search(_ reader: ArrayReader, _ target: Int) -> Int {
        var kth = 1
        while reader.get(kth - 1) < target {
            kth = kth * 2
        }

        var start = 0
        var end = kth - 1

        while start + 1 < end {
            let mid = start + (end - start) / 2
            if reader.get(mid) < target {
                start = mid
            } else {
                end = mid
            }
        }

        if reader.get(start) == target {
            return start
        }
        if reader.get(end) == target {
            return end
        }

        return -1
    }
}

/**
This is an interactive problem.

You have a sorted array of unique elements and an unknown size. You do not have an access to the array but you can use the ArrayReader interface to access it. You can call ArrayReader.get(i) that:

returns the value at the ith index (0-indexed) of the secret array (i.e., secret[i]), or
returns 231 - 1 if the i is out of the boundary of the array.
You are also given an integer target.

Return the index k of the hidden array where secret[k] == target or return -1 otherwise.

You must write an algorithm with O(log n) runtime complexity.



Example 1:

Input: secret = [-1,0,3,5,9,12], target = 9
Output: 4
Explanation: 9 exists in secret and its index is 4.
Example 2:

Input: secret = [-1,0,3,5,9,12], target = 2
Output: -1
Explanation: 2 does not exist in secret so return -1.


Constraints:

1 <= secret.length <= 104
-104 <= secret[i], target <= 104
secret is sorted in a strictly increasing order.
**/