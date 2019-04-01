//
//  CutomTransilation.swift
//  day22-VertiualMenuTransform
//
//  Created by FQL on 2019/4/1.
//  Copyright © 2019 FQL. All rights reserved.
//

import UIKit

@objc protocol DisMissViewControllerDelegate {
    func disMissVC()
}


class CutomTransilation: NSObject , UIViewControllerAnimatedTransitioning {
    
    public var delegate : DisMissViewControllerDelegate!
    public var nagationType : NavigationType!
    
    private var snapView : UIView?
    
    // 看其他人写的，直接调代理就行，我这必须这么转一下呢  奇怪了。。
    @objc func disMissController() {
        self.delegate.disMissVC()
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        /// MARK：参见day15. 用两种不同方式写的。
        let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        let containView = transitionContext.containerView
        
        let fromView = fromVC?.view
        let toView = toVC?.view
        
        if nagationType == .Present {
            
            fromView?.transform = CGAffineTransform(translationX: 0, y: 0)
            toView?.transform = CGAffineTransform(translationX: 0, y: -200)
            
            snapView = fromView?.snapshotView(afterScreenUpdates: true)
            containView.addSubview(toView!)
            containView.addSubview(snapView!)
            
            //奇怪DisMissViewControllerDelegate.disMissVC 不行。。。
            let gesture = UITapGestureRecognizer(target: self, action: #selector(disMissController))
            snapView?.addGestureRecognizer(gesture)
            
            
            UIView.animate(withDuration: 0.5, animations: {
                self.snapView?.transform = CGAffineTransform(translationX: 0, y: containView.frame.height - 250)
                toView?.transform = CGAffineTransform.identity
            }) { (_) in
                transitionContext.completeTransition(true)
                fromVC?.endAppearanceTransition()
                toVC?.endAppearanceTransition()
            }
        }else {
            UIView.animate(withDuration: 0.5, animations: {
                self.snapView?.transform = CGAffineTransform.identity
                fromView?.transform = CGAffineTransform.identity
            }) { (_) in
                self.snapView?.removeFromSuperview()
                fromVC?.endAppearanceTransition()
                toVC?.endAppearanceTransition()
            }
        }
    }
}
