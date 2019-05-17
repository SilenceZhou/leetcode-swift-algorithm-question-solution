import Cocoa

var str = "Hello, playground"

func isPalindrome(_ x: Int) -> Bool {
    
    if x == 0 {
        return true
    }
    
    if x < 0 || x % 10 == 0 {
        return false
    }
    
    var result = 0
    var remain = x
    
    while(remain != 0){
        // 取余的时候符号也被带出
        result = remain % 10 + 10 * result
        //remain = remain / 10
        remain /= 10
    }
    
    return result == x
}
print(isPalindrome(-131))


//// 下面来自网络的解法

func isPalindrome2(_ x: Int) -> Bool {
    if x < 0 || x % 10 == 0 {
        return x == 0 // 这个地方的巧妙之处：合并简化了 两个if判断
    }
    var x = x
    var halfReversedX = 0
    while x > halfReversedX {
        halfReversedX = halfReversedX * 10 + x % 10
        x /= 10
    }
    // even num of digits situation || odd num of digits situaition
    return x == halfReversedX || x == halfReversedX / 10
}

print(isPalindrome2(131))
