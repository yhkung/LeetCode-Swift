/// 1268. Search Suggested System
class Solution {
    private let maximumSuggestedNumber = 3

    func suggestedProducts(_ products: [String], _ searchWord: String) -> [[String]] {
        let products = products.sorted()
        var results = [[String]]()

        var map = [String: Int]()
        for (i, product) in products.enumerated() {
            map[product] = i
        }

        var word = ""
        for c in searchWord {
            word = word + String(c)
            var newResult = [String]()
            var startIndex = 0

            if let prevResult = results.last {
                for product in prevResult {
                    if product.hasPrefix(word) {
                        newResult.append(product)
                        startIndex = map[product]! + 1
                    }
                    if newResult.count == maximumSuggestedNumber {
                        break
                    }
                }
            }

            if newResult.count < maximumSuggestedNumber {
                for i in startIndex..<products.count {
                    if products[i].hasPrefix(word) {
                        newResult.append(products[i])
                    }
                    if newResult.count == maximumSuggestedNumber {
                        break
                    }
                }
            }
            results.append(newResult)
        }
        return results
    }
}
