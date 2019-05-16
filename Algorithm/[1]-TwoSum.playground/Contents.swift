import Cocoa

/**
 * 给定一个整数数组，返回两个数字的索引，使它们相加到特定目标。
 * 您可以假设每个输入只有一个解决方案，并且您可能不会两次使用相同的元素。
 * Given nums = [2, 7, 11, 15], target = 9,
 *
 * Because nums[0] + nums[1] = 2 + 7 = 9,
 * return [0, 1].
 */

/// 双层for循环多了一次的计算
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    
    for i in 0..<nums.count {
        
        var index_i = nums[i]
        print("111111 - i ===== \(i)")
        for j in (i+1)..<nums.count {
            print("22222 - j ===== \(j)")
            var index_j = nums[j]
            
            if (nums[i] + nums[j]) == target {
                return [i, j]
            }
        }
        
    }
    
    return [0, 0]
}

print(twoSum([3,2, 10,3,7, 11,6, 15], 9))
print(twoSum([3,2, 10,3, 10,3, 10,3, 10,3, 10,3, 10,3,7, 11,6, 15], 9))


/// 巧用Dictionay可以减少一次遍历
func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
    
    var result = [Int](repeatElement(0, count: 2))
    //    print(result)
    var map = [Int: Int]()
    //    print(map)
    
    for i in 0..<nums.count {
        print("11111")
        /// 利用了hash直来进行比较是否包含
        if map.keys.contains(target - nums[i]) { // i顺序逆向来推算，用字典的Key值（即元数组的值）来做判断 === 减少了计算的次数
            print("2222")
            result[1] = i
            result[0] = map[target - nums[i]]!
            //            print("i = \(i)  result[1] = \(result[1])  result[0] = \(result[0])")
            return result
        }
        // 把值作为key 然后把需要作为 value === 巧妙之处
        map[nums[i]] = i
        //        print("map = \(map)")
    }
    
    return result
}
print(twoSum2([3,2, 10,3,7, 11,6, 15], 9))
print(twoSum2([3,2, 10,3, 10,3, 10,3, 10,3, 10,3, 10,3,7, 11,6, 15], 9))
