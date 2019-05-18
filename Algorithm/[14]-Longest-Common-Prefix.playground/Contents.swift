import Cocoa

/**
 Write a function to find the longest common prefix string amongst an array of strings.
 
 If there is no common prefix, return an empty string "".
 
 Input: ["flower","flow","flight"]
 Output: "fl"
 
 Input: ["dog","racecar","car"]
 Output: ""
 Explanation: There is no common prefix among the input strings.
 */

func longestCommonPrefix(_ strs: [String]) -> String {
    guard var tmpCompareStr = strs.first else {
        return ""
    }
    if strs.count <= 1  {
        return tmpCompareStr
    }
    
    var commonPrefix = ""
    
    for i in 1..<strs.count {
        
        let string = strs[i]
        var innerCommonPrefxi = ""
        var indexI = 0
        var hasDiff = false
        
        for charI in tmpCompareStr { // 第一串
            
            var indexJ = 0
            
            for charJ in string { // 第二串
                
                if indexI == indexJ{
                    if charI == charJ, hasDiff == false {
                        innerCommonPrefxi.append(charJ)
                    } else {
                        // 只要出现位置相同值不同就准备跳出，由于没有直接跳出一个循环，选择一个折中的办法bool来判断
                        hasDiff = true
                    }
                }
                indexJ += 1
            }
            
            indexI += 1
            tmpCompareStr = innerCommonPrefxi
        }
        commonPrefix = tmpCompareStr
    }
    
    return commonPrefix
}


/// 测试案例
//print(longestCommonPrefix(["flower","flow","flight"]))
//print(longestCommonPrefix(["flower"]))
//print(longestCommonPrefix(["aa", "aa"]))
//print(longestCommonPrefix(["dog","racecar","car"]))
//print(longestCommonPrefix(["aca","cba"]))

func longestCommonPrefix2(_ strs: [String]) -> String {
    guard strs.count > 0 else { return "" }
    
    /// 利用原来的结果和最新的值来进行比较
    return strs.reduce(strs[0]) { result, str in
        
        print(result, str)
        
        if result == str { return str } // 如果结果总是和传递进来的值相等，那么就不用走下面的计算了 -- 简洁
        
        var newResult = ""
        
        for i in 0..<min(result.count, str.count) { // 使用最小值便于减少计算 ,只有一个嵌套
            
            let charIndexA = str.index(result.startIndex, offsetBy: i)
            let charA = result[result.index(result.startIndex, offsetBy: i)]
            
            
            // Value of type 'String.Index' has no member 'class'
            // print(charIndexA.class)
            // charIndexB: String.Index
            let charIndexB = str.index(str.startIndex, offsetBy: i)
            let charB = str[str.index(str.startIndex, offsetBy: i)]
            print("charIndexA = \(charIndexA) charA = \(charA) ,charIndexB = \(charIndexB)  charB = \(charB)")
            
            if charA == charB {
                
                newResult += String(charA)
                
            } else {
                
                break
                
            }
        }
        
        return newResult
    }
}


//print(longestCommonPrefix2(["flower","flow","flight"]))
//print(longestCommonPrefix2(["flower"]))
print(longestCommonPrefix2(["aa", "aa"]))
//print(longestCommonPrefix2(["dog","racecar","car"]))
//print(longestCommonPrefix2(["aca","cba"]))
