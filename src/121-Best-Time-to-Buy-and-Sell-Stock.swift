class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else {
            return 0
        }

        var buy = 0
        var sell = 1
        var maxProfit = 0

        while sell < prices.count {
            if prices[sell] > prices[buy] {
                maxProfit = max(maxProfit, prices[sell] - prices[buy])                
            } else {
                buy = sell
            }
            sell += 1
        }
        
        return maxProfit
    }
}