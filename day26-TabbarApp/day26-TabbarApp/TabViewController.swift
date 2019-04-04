//
//  TabViewController.swift
//  day26-TabbarApp
//
//  Created by FQL on 2019/4/3.
//  Copyright © 2019 FQL. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController{

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.isTranslucent = true
        self.tabBar.backgroundColor = UIColor.white
        self.delegate = self
//        self.tabBar.barTintColor = UIColor.orange  TabBar 整个背景色
        
        createTabbarControllers()
        //一上来就要修改一下btabBar 颜色， 不然第一个会是系统的蓝色样式
        updateTabbarItem()
    }
    
    func createTabbarControllers() -> Void {
        /// 注意： 图片要用这种方式，不然会显示系统蓝色/灰色样式。  也可以在asset 对应图片 rend as那里改成original
        let MainVC = MainViewController()
        let mainItem = UITabBarItem(title: "Main", image: UIImage(named: "index_tab")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), selectedImage: UIImage(named: "index_s_tab")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal))
        MainVC.tabBarItem = mainItem
        let nav1 = UINavigationController(rootViewController: MainVC)
        
        
        let CategoryVC = CategoryViewController()
        let categoryItem = UITabBarItem(title: "Category", image: UIImage(named: "Category_tab")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), selectedImage: UIImage(named: "Category_s_tab")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal))
        CategoryVC.tabBarItem = categoryItem
        let nav2 = UINavigationController(rootViewController: CategoryVC)
        
        
        let AcountVC = AcountViewController()
        let acountItem = UITabBarItem(title: "Acount", image: UIImage(named: "account_tab")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), selectedImage: UIImage(named: "account_tab_s")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal))
        AcountVC.tabBarItem = acountItem
        let nav3 = UINavigationController(rootViewController: AcountVC)
        
        
        self.viewControllers = [nav1, nav2, nav3]
        
    }
    
}



extension TabViewController : UITabBarControllerDelegate {
    //自定义TabBarItem 样式
    func updateTabbarItem () -> Void {
        for (index, item) in (self.tabBar.items?.enumerated())! {
            if index == self.selectedIndex {
                item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.orange], for: UIControl.State.selected)
                item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.lightGray], for: UIControl.State.normal)
            }
        }
    }
    
    //切换Tabbar delegate
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        updateTabbarItem()
    }
    
    /// 在这里也可以设置切换tabBar 的动画效果。 使用系统效果
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        guard let fromView = selectedViewController?.view,
            let toView = viewController.view else {
            return false // Make sure you want this as false
        }

        if fromView != toView {
            UIView.transition(from: fromView, to: toView, duration: 0.75, options: [.transitionCurlDown], completion: nil)
        }

        return true
    }
    
    /// 自定义切换动画效果 基本很少用啦
//    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        return CustomAnimate.init(vcs: tabBarController.viewControllers!)
//    }
    
}



class CustomAnimate: NSObject , UIViewControllerAnimatedTransitioning {
    
    var viewControllers : [UIViewController]
    
    
    init(vcs: [UIViewController]) {
        self.viewControllers = vcs
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        
        let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from)
        let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)
        transitionContext.containerView.addSubview(toView!)
        
        
        UIView.animate(withDuration: 0.35, animations: {
            fromView?.transform = CGAffineTransform(translationX: 0, y: 0)
            toView?.transform = CGAffineTransform(translationX: UIScreen.main.bounds.width, y: 0)
        }) { (_) in
            transitionContext.completeTransition(true)
            fromVC?.endAppearanceTransition()
            toVC?.endAppearanceTransition()
        }
    }
    
    
}
