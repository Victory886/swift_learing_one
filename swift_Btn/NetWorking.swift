//
//  NetWorking.swift
//  swift_Btn
//
//  Created by Terry on 2018/3/29.
//  Copyright © 2018年 Terry. All rights reserved.
//

import UIKit
import Alamofire


class NetWorking: NSObject {

    public func testNet() {
        
        print("开始请求网络")
        getDate()
    }
    
    lazy var getDate = {()->Void in
        
        var url = "https://httpbin.org/get"
        let parameters:Dictionary = ["key":"93c921ea8b0348af8e8e7a6a273c41bd"]
        
        let queue = DispatchQueue.global()
        queue.async {
            Alamofire.request(url).responseJSON { response in
                
                switch response.result {
                case .success:
                    
                    if let JSON = response.result.value {
                        DispatchQueue.main.async {
                            
                            print("json \(JSON)")
                        }
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
}
