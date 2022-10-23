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
    func reverseList(_ head: ListNode?) -> ListNode? {
        var prev: ListNode? = nil
        var curr: ListNode? = head
        
        while curr != nil {
            let next = curr?.next   // next: 4 -> 5 -> nil
            curr?.next = prev       // prev: 2 -> 1, curr: 3 -> 2 -> 1
            prev = curr             // prev: 2 -> 1
            curr = next             // curr: 4 -> 5
        }
        
        return prev
    }
}