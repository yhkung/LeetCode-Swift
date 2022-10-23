/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func detectCycle(_ head: ListNode?) -> ListNode? {    
        if head == nil || head?.next == nil {
            return nil
        }
        
        var slow = head
        var fast = head

        while fast != nil && fast?.next != nil {            
            slow = slow?.next
            fast = fast?.next?.next

            if slow === fast {
                break
            }
        }

        var entry = head
        while !(slow === entry) {
            entry = entry?.next
            slow = slow?.next            
        }
        return entry
    }
}