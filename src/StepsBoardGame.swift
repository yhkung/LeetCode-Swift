func boardGame(_ n: Int) -> Int {
    guard n > 2 else { return n }
    var dp: [Int] = [1]
    for i in 1...n {
        var next = 0
        for j in 1...6 {
            guard i >= j else { break }
            next += dp[i - j]
        }
        dp.append(next)
    }
    return dp[n]
}