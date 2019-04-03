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
        
        let CategoryVC = CategoryViewController()
        let categoryItem = UITabBarItem(title: "Category", image: UIImage(named: "Category_tab")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), selectedImage: UIImage(named: "Category_s_tab")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal))
        CategoryVC.tabBarItem = categoryItem
        
        let AcountVC = AcountViewController()
        let acountItem = UITabBarItem(title: "Acount", image: UIImage(named: "account_tab")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), selectedImage: UIImage(named: "account_tab_s")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal))
        AcountVC.tabBarItem = acountItem
  
        self.viewControllers = [MainVC, CategoryVC, AcountVC]
        
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
    
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return nil
    }
    
}
