//
//  swTest2.swift
//  test22
//
//  Created by dqy on 2019/3/19.
//  Copyright © 2019年 dqy. All rights reserved.
//

import Foundation

class swTest2: NSObject {
    
//    static func log2(){
//        print("qweqweq")
//    }
    
    var address : String
    var gender: String
    
    @objc init(address:String,gender:String) {
        self.address = address
        self.gender = gender
    }
    
    @objc func method() {
        print("messageP \(self.address + self.gender)")
    }
    
}
