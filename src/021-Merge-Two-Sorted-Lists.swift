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
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        return mergeTwoListsV1(list1, list2)
    }

    private func mergeTwoListsRecursively(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        if list1 == nil {
            return list2
        }
        if list2 == nil {
            return list1
        }

        if list1!.val < list2!.val {
            list1?.next = mergeTwoListsRecursively(list1?.next, list2)
            return list1
        } else {
            list2?.next = mergeTwoListsRecursively(list1, list2?.next)
            return list2
        }
    }

    private func mergeTwoListsV1(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var dummy: ListNode? = ListNode(0)
        var curr: ListNode? = dummy
        var node1: ListNode? = list1
        var node2: ListNode? = list2

        while let val1 = node1?.val, let val2 = node2?.val {
            if val1 < val2 {
                curr?.next = node1
                node1 = node1?.next
            } else {
                curr?.next = node2
                node2 = node2?.next
            }
            curr = curr?.next
        }

        if node1 != nil {
            curr?.next = node1
        }

        if node2 != nil {
            curr?.next = node2
        }

        return dummy?.next
    }
}