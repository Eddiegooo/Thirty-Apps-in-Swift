//
//  ImageCollectionViewCell.swift
//  day24-ImageScroll
//
//  Created by FQL on 2019/4/2.
//  Copyright © 2019 FQL. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(customImage)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func fillContentWithImage(imageString: String) -> Void {
        self.customImage.image = UIImage(named: imageString)
    }
    
    lazy var customImage: UIImageView = {
        let imageV = UIImageView(frame: CGRect(x: 0, y: 0, width: self.contentView.frame.width, height: self.contentView.frame.height))
        imageV.center = self.contentView.center
        imageV.contentMode = .scaleToFill
        return imageV
    }()
    
}
