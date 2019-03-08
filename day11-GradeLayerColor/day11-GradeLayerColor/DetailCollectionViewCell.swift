//
//  DetailCollectionViewCell.swift
//  day11-GradeLayerColor
//
//  Created by FQL on 2019/3/8.
//  Copyright © 2019 FQL. All rights reserved.
//

import UIKit


class DetailCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backView.frame = self.contentView.frame
        self.contentView.addSubview(backView)
        
        detailLabel.frame = self.contentView.frame
        self.contentView.addSubview(detailLabel)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        ///MARK:直接这么加  内容显示不出来啊、、、  在加一个底部View
        let gradLayer = CAGradientLayer.init()
        gradLayer.colors = [UIColor.red.cgColor, UIColor.yellow.cgColor]
        gradLayer.frame = self.contentView.frame
        gradLayer.locations = [0.3, 0.7]
//        self.contentView.layer.addSublayer(gradLayer)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func fillContentLabel(string: String, count: Int) -> Void {
        detailLabel.text = string
        
//        let gradLayer = CAGradientLayer.init()
//        gradLayer.colors = [UIColor.red.cgColor, UIColor.yellow.cgColor, UIColor.blue.cgColor]
//        gradLayer.locations = [0.1, 0.5,0.8]
//        gradLayer.frame = backView.frame
//        backView.layer.addSublayer(gradLayer)
        
    }
    
    
    lazy var detailLabel: UILabel = {
        let lab = UILabel(frame: self.contentView.frame)
        lab.textColor = UIColor.black
        let fontName = UIFont.familyNames
        let index = Int(arc4random_uniform(UInt32(fontName.count)))
        lab.font = UIFont(name: fontName[index], size: 16)
        lab.font = UIFont.boldSystemFont(ofSize: 16)
        return lab
    }()
    
    lazy var backView : UIView = {
        let view = UIView(frame: self.contentView.frame)
        let gradLayer = CAGradientLayer.init()
        gradLayer.colors = [UIColor.red.cgColor, UIColor.yellow.cgColor, UIColor.blue.cgColor]
        gradLayer.locations = [0.1, 0.5,0.8]
        gradLayer.frame = view.frame
        view.layer.addSublayer(gradLayer)
        return view
    }()
    
}
