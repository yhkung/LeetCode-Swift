/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        return mergeKLists(lists, 0, lists.count - 1)
    }

    private func mergeKLists(_ lists: [ListNode?], _ start: Int, _ end: Int) -> ListNode? {
        if start > end {
            return nil
        }

        if start == end {
            return lists[start]
        }

        if end - start == 1 {
            return merge(lists[start], lists[end])
        }

        let mid = (start + end) / 2
        let left = mergeKLists(lists, start, mid)
        let right = mergeKLists(lists, mid + 1, end)

        return merge(left, right)
    }

    private func merge(_ leftList: ListNode?, _ rightList: ListNode?) -> ListNode? {
        if leftList == nil {
            return rightList
        }
        if rightList == nil {
            return leftList
        }

        var mergedHead = ListNode(0)
        var merged: ListNode? = mergedHead

        var currentLeft: ListNode? = leftList!
        var currentRight: ListNode? = rightList!

        while let leftValue = currentLeft?.val, let rightValue = currentRight?.val {
            let nextValue: Int
            if leftValue < rightValue {
                nextValue = leftValue
                currentLeft = currentLeft?.next
            } else {
                nextValue = rightValue
                currentRight = currentRight?.next
            }
            merged?.next = ListNode(nextValue)
            merged = merged?.next
        }

        if let leftNode = currentLeft {
            merged?.next = leftNode
        }
        if let rightNode = currentRight {
            merged?.next = rightNode
        }

        return mergedHead.next
    }
}