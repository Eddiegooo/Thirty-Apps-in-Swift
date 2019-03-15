//
//  MenuTransittionManager.swift
//  day15-SlideMenu
//
//  Created by FQL on 2019/3/15.
//  Copyright © 2019 FQL. All rights reserved.
//

import Foundation
import UIKit


@objc protocol ViewControllerTransitionDelegate {
    func dismissViewControler()
}

class TransitionManager: NSObject {
    
    var duration = 0.75
    var isPresenting = false
    
    var delegate: ViewControllerTransitionDelegate?
    var snapView: UIView? {
        didSet {
            if delegate != nil {
                let tap = UITapGestureRecognizer(target: self, action: #selector(ViewControllerTransitionDelegate.dismissViewControler))
                snapView?.addGestureRecognizer(tap)
            }
        }
    }
}



extension TransitionManager : UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromView = transitionContext.view(forKey: .from)!
        let toView = transitionContext.view(forKey: .to)!
        let container = transitionContext.containerView
        let moveLeft = CGAffineTransform(translationX: 200, y: 0)
        let moveRight = CGAffineTransform(translationX: 0, y: 0)
        
        if isPresenting {
            snapView = fromView.snapshotView(afterScreenUpdates: true)
            container.addSubview(toView)
            container.addSubview(snapView!)
        }
        
        UIView.animate(withDuration: duration, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.3, options: .curveEaseInOut, animations: {
            if self.isPresenting {
                self.snapView?.transform = moveLeft
                toView.transform = .identity
            } else {
                self.snapView?.transform = .identity
                fromView.transform = moveRight
            }
            
        }, completion: { finished in
            transitionContext.completeTransition(true)
            if !self.isPresenting {
                self.snapView?.removeFromSuperview()
            }
        })
    }
    
    
    
    ///  UIViewControllerTransitioningDelegate
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.isPresenting = false
        return self
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.isPresenting = true
        return self
    }
}
