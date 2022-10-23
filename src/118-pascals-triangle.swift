class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        guard numRows > 0 else { return [] }        

        var rows = Array(repeating: [Int](), count: numRows)        
        
        for row in 0..<numRows {            
            var nums = Array(repeating: 0, count: row + 1)
            for i in 0...row {         
                if i == 0 || i == row {
                    nums[i] = 1
                } else {
                    let previousRow = rows[row - 1] 
                    nums[i] = previousRow[i - 1] + previousRow[i]
                }
            }
            rows[row] = nums
        }

        return rows
    }
}