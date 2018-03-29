//
//  Block.swift
//  swift_Btn
//
//  Created by Terry on 2018/3/29.
//  Copyright © 2018年 Terry. All rights reserved.
//

import UIKit

class Block: NSObject {
    
    typealias textBlock = (String)->()
    var block:textBlock?
    func callBlock(block:textBlock?) {
        
        self.block = block
    }
    
    func click() {
        
        if let block  =  self.block {
            
            block("li01")
        }
    }
}
