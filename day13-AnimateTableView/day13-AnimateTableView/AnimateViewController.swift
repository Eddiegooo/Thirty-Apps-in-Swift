//
//  AnimateViewController.swift
//  day13-AnimateTableView
//
//  Created by FQL on 2019/3/12.
//  Copyright © 2019 FQL. All rights reserved.
//

import UIKit

class AnimateViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.green
        self.view.addSubview(dissmisBtn)
        self.view.addSubview(centerView)
        self.view.addSubview(detailLabel)
    }
    
    /// Animation 做显示动画
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //底色收成一个圆， 然后在展示成一个View   CGRect(x: self.view.frame.width / 2 - 50, y: self.view.frame.height / 2 - 50, width: 100, height: 100);  然后在显示出Label
        
        ///用了一个最简单的方式实现缩放  这里可以使用贝塞尔曲线画吧
        UIView.animate(withDuration: 1) {
            self.centerView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
            self.centerView.frame = CGRect(x: self.view.frame.width / 2 - 50, y: self.view.frame.height / 2 - 50, width: 100, height: 100);
            
            UIView.animate(withDuration: 1, delay: 1.5, usingSpringWithDamping: 1, initialSpringVelocity: 3, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                self.detailLabel.frame = CGRect(x: 50, y: self.centerView.frame.maxY + 100, width: self.view.frame.width - 100, height: 60)
            }, completion: nil)
        }
        
    }
    
    @objc func dismissVC() {
        self.dismiss(animated: true, completion: nil)
    }
    
    lazy var dissmisBtn: UIButton = {
        let btn = UIButton(type: UIButton.ButtonType.custom)
        btn.frame = CGRect(x: 20, y: 100, width: 40, height: 40)
        btn.setImage(UIImage(named: "cancel"), for: UIControl.State.normal)
        btn.addTarget(self, action: #selector(dismissVC), for: UIControl.Event.touchUpInside)
        ///想省事这样写.不行。。
//        btn.addTarget(self, action: #selector(dismiss(animated:completion:)), for: .touchUpInside)
        return btn
    }()
    
    
    lazy var centerView : UIView = {
//        let view = UIView(frame: CGRect(x: self.view.frame.width / 2 - 50, y: self.view.frame.height / 2 - 50, width: 100, height: 100))
        let view = UIView(frame: self.view.frame)
        view.backgroundColor = UIColor.blue
        return view
    }()
    
    lazy var detailLabel: UILabel = {
        let lab = UILabel.init(frame: CGRect(x: 50, y: self.view.frame.height, width: self.view.frame.width - 100, height: 60))
        lab.text = "This is no special String ,just kan kan"
        lab.font = UIFont.boldSystemFont(ofSize: 16)
        lab.textColor = UIColor.red
        return lab
    }()
    
}
