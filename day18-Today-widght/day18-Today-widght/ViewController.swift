//
//  ViewController.swift
//  day18-Today-widght
//
//  Created by FQL on 2019/3/22.
//  Copyright © 2019 FQL. All rights reserved.
//

import UIKit

/// 1.新建：
/// File --》 New --》Target --》Today Extention。  新建运行， 就会在TodayWidght 页面显示本APP了
/// 2.设置Today界面内容
/// 3.实现跳转。 URLType
/// 4.内容是通过NUserDefault传递的。
/// 注意： 怎么让Widght 和 App对应起来呢？
//1. App 上打开 App group 。添加自己的BundleID
//2. 在Widght 上进行同样的操作，打开 App group， 勾选对应的BundleID


//注意： 传值应该是：从App到Today的传值，  反着不行吧？？？
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        
        self.view.addSubview(detailLabel)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        /// 注意！！！！存、取值都要用这个key。 group+BoundleId
        UserDefaults.standard.addSuite(named: "group.Eddie.day18-Today-widght")// SuiteName必须和上面Capabilities配置填写的一致

        UserDefaults.standard.set("Today Widght 来了 老弟", forKey: "laile")
        UserDefaults.standard.synchronize()
    }
    
    

    lazy var detailLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 200, width: self.view.frame.width - 50, height: 100))
        label.text = "test"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
}

