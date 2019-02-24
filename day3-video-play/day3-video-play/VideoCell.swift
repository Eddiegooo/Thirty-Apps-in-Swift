//
//  VideoCell.swift
//  day3-video-play
//
//  Created by 范清龙 on 2019/2/24.
//  Copyright © 2019 范清龙. All rights reserved.
//

import UIKit

//定义一个结构体，数据初始化
struct videoData {
    let image: String
    let title: String
    let time: String 
}

//Swift中有代理,没有Block,取代的是闭包.
//typealias swiftBlcok = () -> Void

class VideoCell: UITableViewCell {
    
//    let playBlock: swiftBlcok?
    
    //自定义cell 这个必须要写的..      xib  要学习下
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setInitView()
        
    }
    
    
    func setInitView () -> Void {
        self.contentView.addSubview(backImage)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(timeLabel)
    }
    
    @objc func playVideo() {
//        if playBlock != nil  {
//            playBlock!()
//        }
    }
    
    lazy var backImage: UIImageView = {
        //这么设置frame 不对呢？？？ 奇怪了。。
//        UIImageView(frame: self.contentView.frame)
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 150))
        image.contentMode = .scaleToFill
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 80, width: self.contentView.frame.width, height: 40))
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var timeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 120, width: self.contentView.frame.width, height: 30))
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    
    lazy var palyBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "play"), for: .normal)
        btn.frame = CGRect(x: UIScreen.main.bounds.width / 2 - 25, y: 50, width: 50, height: 50)
        btn.addTarget(self, action: #selector(playVideo), for: .touchUpInside)
        return btn
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
