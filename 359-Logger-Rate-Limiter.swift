class Logger {
    private let interval = 10
    private var lastSeen: [String: Int] = [:]

    init() { }

    /** Returns true if the message should be printed in the given timestamp, otherwise returns false.
        If this method returns false, the message will not be printed.
        The timestamp is in seconds granularity. */
    func shouldPrintMessage(_ timestamp: Int, _ message: String) -> Bool {
        if lastSeen[message] == nil {
            lastSeen[message] = timestamp
            return true
        }

        if let lastTimestamp = lastSeen[message], timestamp - lastTimestamp >= interval {
            lastSeen[message] = timestamp
            return true
        }
        return false
    }
}

/**
 * Your Logger object will be instantiated and called as such:
 * let obj = Logger()
 * let ret_1: Bool = obj.shouldPrintMessage(timestamp, message)
 */