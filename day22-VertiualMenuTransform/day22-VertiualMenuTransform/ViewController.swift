//
//  ViewController.swift
//  day22-VertiualMenuTransform
//
//  Created by FQL on 2019/3/30.
//  Copyright © 2019 FQL. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIViewControllerTransitioningDelegate ,DisMissViewControllerDelegate{
    
    var customTrans = CutomTransilation()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.white
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Present", style: UIBarButtonItem.Style.plain, target: self, action: #selector(trasferToMeunItemVC))
        self.view.addSubview(customImage)
    }


    @objc func trasferToMeunItemVC () {
        let VC = MenuTableViewController()
        //系统自带方式就那么几种 有局限性
//        VC.modalTransitionStyle = .flipHorizontal
//        VC.modalPresentationStyle = .pageSheet
//        self.navigationController?.present(VC, animated: true, completion: nil)
        
        
        ///MARK： 走代理方法 自定义转场方式
        VC.transitioningDelegate = self
        VC.modalPresentationStyle = .custom
        self.navigationController?.present(VC, animated: true, completion: nil)
    }
    
    
    
    /// MARK: Delegate
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        customTrans.delegate = self
        customTrans.nagationType = .Present
        return customTrans
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        customTrans.nagationType = .Dismiss
        return customTrans
    }
    
    func disMissVC() {
        dismiss(animated: true, completion: nil)
    }
    
    
    lazy var customImage: UIImageView = {
        let imageV = UIImageView(frame: CGRect(x: 0, y: 100, width: self.view.frame.width, height: self.view.frame.height - 100))
        imageV.center = self.view.center
        imageV.contentMode = .scaleAspectFit
        imageV.image = UIImage(named: "mei")
        return imageV
    }()
}

//枚举 
public enum NavigationType : Int {
    case Present = 0
    case Dismiss = 1
}
