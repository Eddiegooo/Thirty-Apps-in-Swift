//
//  ViewController.swift
//  day12-Animation-pickView
//
//  Created by FQL on 2019/3/11.
//  Copyright © 2019 FQL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.cyan
        
        ///MARK:模糊视图
//        let effect = UIBlurEffect(style: .light)
//        let effectView = UIVisualEffectView(effect: effect)
//        effectView.frame = self.view.frame
//        self.view.addSubview(effectView)
        
        ///渐变颜色
        let cgaLayer = CAGradientLayer.init()
        cgaLayer.frame = self.view.frame //注意设置frame
        cgaLayer.colors = [UIColor.cyan.cgColor, UIColor.lightGray.cgColor]
        cgaLayer.locations = [0.2,0.9]
//        cgaLayer.startPoint = CGPoint(x: 0.3, y: 0.2)
//        cgaLayer.endPoint = CGPoint(x: 0.8, y: 0.75)
        self.view.layer.addSublayer(cgaLayer)
        
        self.view.addSubview(enterBtn)

    }

    @objc func enterApp() {
        self.present(LoginController(), animated: true, completion: nil)
    }
    
    
    lazy var enterBtn : UIButton = {
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 100, y: self.view.frame.height - 140, width: self.view.frame.width - 200, height: 40)
        btn.setTitle("Enter App", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.backgroundColor = UIColor.green
        btn.layer.cornerRadius = 5.0
        btn.layer.borderWidth = 1.0
        btn.layer.borderColor = UIColor.cyan.cgColor
        btn.addTarget(self, action: #selector(enterApp), for: .touchUpInside)
        return btn
    }()
    

}

