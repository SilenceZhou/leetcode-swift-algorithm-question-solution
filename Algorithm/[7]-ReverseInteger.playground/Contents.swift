import Cocoa

/**
 对一个 Int32的整形进行反转
 测试值：
 0
 1234567898
 123
 */

func reverse(_ x: Int) -> Int {
    
    if x == 0 || x < Int32.min || x > Int32.max {
        return 0
    }
    
    /// 取符号
    let symbol = x / abs(x)
    /// 取余（使用绝对值来进行计算0
    var rever = abs(x)
    /// 取商
    var tmp = abs(x)
    /// 最终结果
    var result = 0
    /// 优化建议： 把取符号、取余、取商的中间临时变量可以去掉 => 整成 result 和 remain
    
    repeat {
        rever = tmp % 10;
        tmp = tmp / 10;
        result = (result + rever) * (tmp > 0 ? 10 : 1);
        
        /// 由于结果一定要是Int32里面的值 所以的进行处理再返回
        if result < Int32.min || result > Int32.max {
            return 0
        }
        // print("tmp - \(tmp)  rever - \(rever)  result - \(result)")
    
    } while (tmp > 0)
    return result * symbol
}


/// 简洁: 参数较少
func reverse2(_ x: Int) -> Int {
    
    if x == 0 {
        return 0
    }
    
    var result = 0
    var remain = x
    
    while(remain != 0){
        // 取余的时候符号也被带出
        result = remain % 10 + 10 * result
        remain = remain / 10
        
        // 在结果处判断
        if (result < Int32.min || result > Int32.max) {
            return 0
        }
    }
    
    return result
}


print("-----")
print(reverse2(1234567289))
