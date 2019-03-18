//
//  ViewController.swift
//  day16-3DTouch
//
//  Created by FQL on 2019/3/16.
//  Copyright © 2019 FQL. All rights reserved.
//

import UIKit
import SafariServices


///为了能够使用 Peak & Pop 功能，我们需要遵循 UIViewControllerPreviewingDelegate 协议——这个协议会告知我们用户使用 3D Touch 功能点击了哪儿，
class ViewController: UIViewController , UIViewControllerPreviewingDelegate {
    
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        previewingContext.sourceRect = CGRect(x: 40, y: 50, width: 300, height: 500)
        return SFSafariViewController.init(url: (URL.init(string: "https:www.baidu.com") ?? nil)!)
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        self.show(viewControllerToCommit, sender: self)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

}


extension SFSafariViewController {
    //按压弹出的事件   可以设置组类别
    open override var previewActionItems: [UIPreviewActionItem] {
        
        let deleteAction = UIPreviewAction(title: "删除", style: .destructive) { (previewAction, vc) in
            print("Delete")
        }
        let doneAction = UIPreviewAction(title: "完成", style: .default) { (previewAction, vc) in
            print("Done")
        }
        
        return [deleteAction,doneAction];
        
//        let actionGroup = UIPreviewActionGroup(title: "action", style: UIPreviewAction.Style.default, actions: [deleteAction,doneAction])
//        let tapAction1 = UIPreviewAction(title: "tap1", style: .destructive) { (previewAction, vc) in
//            print("tap1")
//        }
//        let tapAction2 = UIPreviewAction(title: "tap2", style: .default) { (previewAction, vc) in
//            print("tap2")
//        }
//        let tapGroup = UIPreviewActionGroup(title: "tap", style: UIPreviewAction.Style.destructive, actions: [tapAction1, tapAction2])
//        return [actionGroup,tapGroup]
    }
}

