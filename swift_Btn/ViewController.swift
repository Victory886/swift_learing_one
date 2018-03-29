//
//  ViewController.swift
//  swift_Btn
//
//  Created by Terry on 2018/3/26.
//  Copyright © 2018年 Terry. All rights reserved.
//

import UIKit
import SnapKit
import Alamofire

class ViewController: UIViewController {
    
    lazy var testView :UIView   = UIView()      //** 定义一个View */
    lazy var btn :UIButton      = UIButton()    //** 定义一个按钮 */
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let net = NetWorking()
        net.testNet()

    
        initWithView()
        initWithBtn()
    }
    
    /// 初始化一个视图
    func initWithView() {
        
        testView = createView()
        testView.snp.makeConstraints { (make) in
            
            make.width.height.equalTo(100)
            make.center.equalTo(view)
        }
    }

    /// 初始化一个按钮
    func initWithBtn()  {
        
        btn = createBtn()
        btn.snp.makeConstraints { (make) in
            
            make.top.equalTo(testView.snp.bottom).offset(10)
            make.left.equalTo(10)
            make.right.equalTo(view.snp.right).offset(-10)
            make.height.equalTo(45)
        }
    }
    
    ///  懒加载一个View
    lazy var createView = {()-> UIView in
        
        let testView = UIView()
        testView.backgroundColor = .red
        self.view.addSubview(testView)
        return testView
    }
    
    ///  懒加载一个按钮
    lazy var createBtn = {()->UIButton in
        
        let btn = UIButton(type:.custom)
        btn.setTitle("d123456789", for: .normal)
        btn .setTitleColor(.black, for: .normal)
        btn.backgroundColor = .green
        btn.addTarget(self, action:#selector(self.buttonAction), for: .touchUpInside)
        self.view.addSubview(btn)
        btn.isSelected = false
        return btn
    }
    
    
    
        
    }
    
    
   
    @objc private func buttonAction(btn:UIButton) -> Void {
        
        print("do nothine")
        btn.isSelected = !btn.isSelected;
        testView.backgroundColor = btn.isSelected ? .yellow : .red
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

