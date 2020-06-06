/// 406 - Queue Reconstruction by Weight
/// - Link: https://leetcode.com/problems/queue-reconstruction-by-height/
/// - Time Complexity: *O(N^2)*
/// - Space Complexity: O(N)
class Solution {
    func reconstructQueue(_ people: [[Int]]) -> [[Int]] {
        return
            people.sorted { person1, person2 in
                let h1 = person1[0] // Height of person 1
                let h2 = person2[0] // Height of person 2
                let k1 = person1[1] // Number of people in front of person 1
                let k2 = person2[1] // Number of people in front of person 2
                if h1 == h2 {
                    return k1 < k2
                } else {
                    return h1 > h2
                }
            }
            .reduce(into: [[Int]]()) { queue, person in
                let index = person[1]
                queue.insert(person, at: index)
            }
    }
}