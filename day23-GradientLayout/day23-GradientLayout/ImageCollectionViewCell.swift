//
//  ImageCollectionViewCell.swift
//  day23-GradientLayout
//
//  Created by FQL on 2019/3/30.
//  Copyright © 2019 FQL. All rights reserved.
//

import UIKit

//自定义CollectionCell  重写initframe方法

class ImageCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customImage.frame = self.contentView.frame
        self.contentView.addSubview(customImage)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var customImage: UIImageView = {
        let imageV = UIImageView(frame: CGRect(x: 50, y: 100, width: 200, height: 200))
        imageV.center = self.contentView.center
        imageV.contentMode = .scaleAspectFit
        imageV.tag = 666
        return imageV
    }()
}
