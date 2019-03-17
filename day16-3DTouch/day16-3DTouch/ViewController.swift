//
//  ViewController.swift
//  day16-3DTouch
//
//  Created by FQL on 2019/3/16.
//  Copyright © 2019 FQL. All rights reserved.
//

import UIKit
import SafariServices

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

