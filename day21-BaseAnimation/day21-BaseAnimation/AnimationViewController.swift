//
//  AnimationViewController.swift
//  day21-BaseAnimation
//
//  Created by FQL on 2019/3/29.
//  Copyright © 2019 FQL. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.view.addSubview(customImage)
        baseAnimation()
    }
    
    func baseAnimation () -> Void {
//        Spring: 模拟弹簧弹跳的效果
//        参数: Damping:阻尼 0-1 阻尼越小动画越明显
//        参数: initialSpringVelocity : 动画初始变化速度
        UIView.animate(withDuration: 2, delay: 0.5, usingSpringWithDamping: 0.1, initialSpringVelocity: 10, options: UIView.AnimationOptions.curveEaseInOut, animations: {
            self.customImage.frame.origin.x = 200
        }) { (isFinish) in
//            self.customImage.frame =  CGRect(x: 50, y: 100, width: 200, height: 200)
        }
    }
    
    lazy var customImage: UIImageView = {
        let imageV = UIImageView(frame: CGRect(x: 50, y: 100, width: 200, height: 200))
        imageV.center = self.view.center
        imageV.contentMode = .scaleAspectFit
        imageV.image = UIImage(named: "zaime")
        return imageV
    }()

}




class LineViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(customImage)
        
        linenerAnimation()
    }
    
    
    func linenerAnimation() -> Void {
        // 创建  以关键字段   位置变化
        let keyFrame = CAKeyframeAnimation(keyPath: "position")
    
        //  建几个动画的位置
        let p1 = CGPoint(x: 20, y: 100);
        let p2 = CGPoint(x:20, y: 400);
        let p3 = CGPoint(x:400, y: 100);
        let p4 = CGPoint(x:100, y: 200);
        let p5 = CGPoint(x:200, y: 300);
        let v1 = NSValue(cgPoint: p1)
        let v2 = NSValue(cgPoint: p2)
        let v3 = NSValue(cgPoint: p3)
        let v4 = NSValue(cgPoint: p4)
        let v5 = NSValue(cgPoint: p5)
        //属性 values :  数组对象 里面的元素称为"keyFrame"(关键帧), 动画对象会在指定的时间里 (duration). 依次显示values 数组中的每一个关键帧
        keyFrame.values = [v1,v2,v3,v4,v5];
        keyFrame.duration = 10;
        // 每一帧的时间,  每一帧的时间为比例的累加计算  取值范围 0-1,没有设置的话 每一帧的时间是平分的
        keyFrame.keyTimes = [0.1,0.2,0.3,0.4];
        self.customImage.layer.add(keyFrame, forKey: "随便你写啥，系统保留关键字")
    }
    
    lazy var customImage: UIImageView = {
        let imageV = UIImageView(frame: CGRect(x: 50, y: 100, width: 200, height: 200))
        imageV.center = self.view.center
        imageV.contentMode = .scaleAspectFit
        imageV.image = UIImage(named: "666")
        return imageV
    }()
}




class RotationViewController: UIViewController {
    var rotation : CGFloat = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(customImage)
        
        rotationAnimation()
    }
    
    //旋转  两个方法都行。  更倾向于下面方式。
    func rotationAnimation () -> Void {
//        let customTimer = Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { (timer) in
//            self.rotation = self.rotation + 0.04
//            if self.rotation > 6.28 { //具体多少是一圈呢？？？
//                self.rotation = 0
//            }
//            UIView.animate(withDuration: 0.05, animations: {
//                self.customImage.transform = CGAffineTransform(rotationAngle: self.rotation)
//            })
//        }
//        customTimer.fire()
        
        let time = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
            let rotationAni = CABasicAnimation(keyPath: "transform.rotation")
            rotationAni.fromValue = 0
            rotationAni.toValue = Double.pi * 2
            rotationAni.duration = 1.0
            self.customImage.layer.add(rotationAni, forKey: "transform.rotation")
        }
        time.fire()

    }
    
    lazy var customImage: UIImageView = {
        let imageV = UIImageView(frame: CGRect(x: 50, y: 100, width: 200, height: 200))
        imageV.center = self.view.center
        imageV.contentMode = .scaleAspectFit
        imageV.image = UIImage(named: "bb")
        return imageV
    }()
    
}



class ScaleViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(customImage)
        scaleAnimation()
    }
    
    // 放大、缩小视图。
    func scaleAnimation () -> Void {
        let timer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true) { (timer) in
            UIView.animate(withDuration: 1.5, animations: {
                self.customImage.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            }, completion: { (isFinish) in
                self.customImage.transform = CGAffineTransform.identity //回复到原来状态
            })
        }
        timer.fire()
    }

    lazy var customImage: UIImageView = {
        let imageV = UIImageView(frame: CGRect(x: 50, y: 100, width: 200, height: 200))
        imageV.center = self.view.center
        imageV.contentMode = .scaleAspectFit
        imageV.image = UIImage(named: "666")
        return imageV
    }()
}




class AlphaViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(customImage)
        // Do any additional setup after loading the view.
        self.customImage.alpha = 0
        
        pageModeAnimation()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 1) {
            self.customImage.alpha = 1
        }
    }
    
    /// 移动动画
    func pageModeAnimation() -> Void {
        let cation = CATransition.init()
        cation.type = .moveIn
        cation.startProgress = 0
        cation.endProgress = 1
        cation.subtype = CATransitionSubtype.fromLeft
        cation.repeatCount = 3
        cation.duration = 1.5
        self.customImage.layer.add(cation, forKey: "test")
    }
    
    lazy var customImage: UIImageView = {
        let imageV = UIImageView(frame: CGRect(x: 50, y: 100, width: 200, height: 200))
        imageV.center = self.view.center
        imageV.contentMode = .scaleAspectFit
        imageV.image = UIImage(named: "666")
        return imageV
    }()
}

