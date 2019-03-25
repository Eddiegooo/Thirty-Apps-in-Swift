//
//  TodayViewController.swift
//  Widght
//
//  Created by FQL on 2019/3/22.
//  Copyright © 2019 FQL. All rights reserved.
//

import UIKit
import NotificationCenter

/// 注意： Today-Widght  视图不可以滚动，不可以左右滑动。  可以展示更多、更少
class TodayViewController: UIViewController, NCWidgetProviding {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
        // 显示展示更多按键
        self.extensionContext?.widgetLargestAvailableDisplayMode = .expanded
        
        self.view.backgroundColor = UIColor.cyan
        self.view.addSubview(customBtn) //自定义视图的frame 值得研究下。。
        self.view.addSubview(detailLabel)
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        /// 注意！！！！存、取值都要用这个
        UserDefaults.standard.addSuite(named: "group.Eddie.day18-Today-widght")// SuiteName必须和上面Capabilities配置填写的一致
        
        self.customBtn.setTitle(UserDefaults.standard.object(forKey: "laile") as? String, for: .normal)  
        
    }
    
    
    @objc func transferToApp() {
        let url = URL(string: "Widght://")
        self.extensionContext?.open(url!, completionHandler: nil)
    }
    
    lazy var customBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 100)
        btn.setTitle("来了老弟，点我啊", for: .normal)
        btn.setTitleColor(UIColor.red, for: .normal)
        btn.setImage(UIImage(named: ""), for: .normal)
        btn.backgroundColor = UIColor.white
        btn.addTarget(self, action: #selector(transferToApp), for: UIControl.Event.touchUpInside)
        return btn
    }()
    
    lazy var detailLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 200, width: self.view.frame.width - 50, height: 100))
        label.text = "test"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
    ///展示更多、收起c折叠
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        ///这个高度最大也不会高于屏幕高。  随便设置你想的高度
        if activeDisplayMode == .expanded {
            self.preferredContentSize = CGSize(width: maxSize.width, height: 400)
        }else {
            self.preferredContentSize = maxSize
        }
    }
    
    
    ///这个设置边距方法已经废弃了。。。
//    func widgetMarginInsets(forProposedMarginInsets defaultMarginInsets: UIEdgeInsets) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//    }
    
}
