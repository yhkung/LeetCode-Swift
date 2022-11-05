class Codec {
    func encode(_ strs: [String]) -> String {
        var result = ""
        for s in strs {
            result += "\(s.count)#\(s)"
        }
        return result
    }
    
    func decode(_ s: String) -> [String] {
        let s = Array(s)
        var result = [String]()
        var i = 0
        while i < s.count {
            var j = i
            while s[j] != "#" {
                j += 1
            }
            let length = Int(String(s[i..<j])) ?? 0
            let str = String(s[(j + 1)..<(j + 1 + length)])
            result.append(str)
            i = j + 1 + length
        }
        return result
    }
}

/**
 * Your Codec object will be instantiated and called as such:
 * let obj = Codec()
 * val s = obj.encode(strs)
 * let ans = obj.decode(s)
*/

/// Java Solution
// public class Solution {
//     /*
//      * @param strs: a list of strings
//      * @return: encodes a list of strings to a single string.
//      */
//     public String encode(List<String> strs) {
//         String str = ""; 
//         for (String s : strs) {
//             str += s.length() + "#" + s;
//         }
//         return str;
//     }

//     /*
//      * @param str: A string
//      * @return: dcodes a single string to a list of strings
//      */
//     public List<String> decode(String str) {
//         List<String> list = new ArrayList<>();
//         int i = 0;
//         while (i < str.length()) {
//             int j = i;
//             while (str.charAt(j) != '#') {
//                 j += 1;
//             }
//             int length = Integer.parseInt(str, i, j, 10);
//             String decodedStr = str.substring(j + 1, j + 1 + length);
//             list.add(decodedStr);
//             i = j + 1 + length;
//         }

//         return list;
//     }
// }