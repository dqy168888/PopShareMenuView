//
//  testSwCall.swift
//  test22
//
//  Created by dqy on 2019/3/19.
//  Copyright © 2019年 dqy. All rights reserved.
//

import Foundation

class testSwCall: NSObject {
    
    //暴露出给oc的方法
    @objc static func log1() {
        print("dfdfd")
    }
    
    @objc static func logString(str:String)
    {
        NSLog("打印:%@", str )
    }
    
    @objc static func printArr ()
    {
        var array = [1,2,3]
        for number in array {
            print(number)
            array = [4,5,6]
        }
        print(array)
    }
}
