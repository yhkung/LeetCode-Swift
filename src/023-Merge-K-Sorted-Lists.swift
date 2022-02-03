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
        return mergeLists(lists, 0, lists.count - 1)
    }

    private func mergeKLists(_ lists: [ListNode?], _ start: Int, _ end: Int) -> ListNode? {
        guard start <= end else {
            return nil
        }
        if start == end {
            return lists[start]
        }

        let mid = (end - start) / 2 + start

        var list1: ListNode? = mergeLists(lists, start, mid)
        var list2: ListNode? = mergeLists(lists, mid + 1, end)

        if list1 == nil {
            return list2
        }

        if list2 == nil {
            return list1
        }

        var dummy: ListNode = ListNode(0)
        var merged: ListNode? = dummy

        while let value1 = list1?.val, let value2 = list2?.val {
            if value1 < value2 {
                merged?.next = list1
                list1 = list1?.next
            } else {
                merged?.next = list2
                list2 = list2?.next
            }
            merged = merged?.next
        }

        if list1 == nil {
            merged?.next = list2
        }
        if list2 == nil {
            merged?.next = list1
        }

        return dummy.next
    }
}