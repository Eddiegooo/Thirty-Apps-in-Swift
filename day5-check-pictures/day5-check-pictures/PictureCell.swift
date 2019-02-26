//
//  PictureCell.swift
//  day5-check-pictures
//
//  Created by FQL on 2019/2/26.
//  Copyright © 2019 FQL. All rights reserved.
//

import UIKit

class PictureCell: UICollectionViewCell {
    
    override init(frame:CGRect){
        super.init(frame: frame)
        self.contentView.addSubview(self.picImage)
        self.contentView.addSubview(self.descLabel)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.layer.cornerRadius = 5.0
        self.contentView.layer.masksToBounds = true
        
    }
    
    
    func fillContentWithModel(model: DataModel) -> Void {
        self.picImage.image = model.picture
        self.descLabel.text = model.title
    }
    
    
    lazy var picImage: UIImageView = {
        let pic = UIImageView(frame: self.contentView.frame)
        pic.contentMode = UIView.ContentMode.scaleToFill
        return pic
    }()
    
    lazy var descLabel: UILabel = {
        let lab = UILabel(frame: CGRect(x: 0, y: self.contentView.frame.height - 30, width: UIScreen.main.bounds.width, height: 30))
        lab.textColor = UIColor.white
        lab.font = UIFont.systemFont(ofSize: 16)
        lab.textAlignment = .center
        return lab
    }()
}
