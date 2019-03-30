//
//  ViewController.swift
//  day23-GradientLayout
//
//  Created by FQL on 2019/3/30.
//  Copyright © 2019 FQL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = .cyan
        self.view.addSubview(detailLabel)
        
        // 距离当前时间的纳秒数
//        DispatchTime(uptimeNanoseconds: 10000000)
        //延迟两秒执行函数
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            /// ：注意这里！！！！s直接使用UICollectionViewController， 初始化必须这样， 否则报错。'UICollectionView must be initialized with a non-nil layout parameter'
            
            let vc = GradientCollectionViewController.init(collectionViewLayout: UICollectionViewLayout.init())
            self.present(vc, animated: true, completion: nil)
        }
    }

    lazy var detailLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 200, width: self.view.frame.width - 50, height: 100))
        label.text = "2s later go to GradientVC"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

}

