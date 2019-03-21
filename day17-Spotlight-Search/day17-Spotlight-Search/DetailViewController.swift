//
//  DetailViewController.swift
//  day17-Spotlight-Search
//
//  Created by FQL on 2019/3/21.
//  Copyright © 2019 FQL. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var detailString: String?
    var imageName: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(backImageView)
        self.view.addSubview(detailLabel)
    }
    lazy var backImageView: UIImageView = {
        let imageV = UIImageView(frame: CGRect(x: 20, y: 100, width: 80, height: 80))
        imageV.center.x = self.view.center.x
        imageV.image = UIImage(named: self.imageName!)
        return imageV
    }()
    
    lazy var detailLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 200, width: self.view.frame.width - 50, height: 100))
        label.text = self.detailString
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

}
