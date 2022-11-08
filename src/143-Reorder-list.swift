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
 // Time: O(n), Space: O(1)
class Solution {
    func reorderList(_ head: ListNode?) {
        // 1. find middle
        // slow fast pointer algo
        var slow = head
        var fast = head?.next
        // 1, 2, 3, 4, 5
        //       s
        //               f

        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }        
        var second = slow?.next
        // Get next second half from the next of `slow` pointer

        // !! Disconnect first & second list
        slow?.next = nil

        // 2. reverse second half        
        var prev: ListNode? = nil
        var curr = second
        while curr != nil {
            let next = curr?.next
            curr?.next = prev
            prev = curr
            curr = next
        }
        second = prev
                
        // 3. merge two lists
        var first = head
        while second != nil {
            var tmp1 = first?.next // 1, "2"
            var tmp2 = second?.next // 4 -> "3"
            first?.next = second // 1 -> 4
            second?.next = tmp1 // 1 -> 4 -> 2
            first = tmp1
            second = tmp2 // 3
        }
    }
}