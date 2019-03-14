//
//  ViewController.swift
//  day14-Animate
//
//  Created by FQL on 2019/3/14.
//  Copyright © 2019 FQL. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CAAnimationDelegate {

    var animateLayer : CALayer?
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       self.view.backgroundColor = UIColor.cyan
        
        
        animateLayer = CALayer()
        animateLayer?.contents = UIImage(named: "twitter")?.cgImage
        //内容填充方式 这个和contentMode 类似， 拉伸、填充、居左居右居上等等。
        animateLayer?.contentsGravity = CALayerContentsGravity.resizeAspect
        
        animateLayer?.bounds = CGRect(x: 0, y: 0, width: 100, height: 81)
        //这个没看出有啥大作用。  几何锚点
        animateLayer?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        animateLayer?.position = CGPoint(x: self.view.frame.width / 2, y: self.view.frame.height / 2)
        self.view.layer.mask = animateLayer
        
        animateDetail()
    }

    func animateDetail()  {
        /// 具体动画样式参考 https://www.jianshu.com/p/bd041182ae2d
        
        let keyAnimate = CAKeyframeAnimation(keyPath: "bounds")
        keyAnimate.duration = 1.0
        //注意这里加一个代理 动画结束了 要做处理
        keyAnimate.delegate = self as CAAnimationDelegate

        keyAnimate.beginTime = CACurrentMediaTime() + 0.5
        keyAnimate.timingFunctions = [CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut), CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)]

        /// 这个加了也没啥效果呢。。。
        do {
            // 动画需要加上这段代码，否则会造成页面闪一下
            keyAnimate.fillMode = .forwards
            keyAnimate.isRemovedOnCompletion = false
        }

        let startBounds = animateLayer?.bounds
        let secondBounds = CGRect(x: 0, y: 0, width: 100, height: 81)
        let endBounds = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width * 2, height: UIScreen.main.bounds.height * 2)

        keyAnimate.values = [NSValue(cgRect: startBounds!), NSValue(cgRect: secondBounds), NSValue(cgRect: endBounds)]
        keyAnimate.keyTimes = [0, 0.5, 1]
        animateLayer?.add(keyAnimate, forKey: "bounds")
    }

    /// MARK: Delegate
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.view.layer.mask = nil
    }
    
}

