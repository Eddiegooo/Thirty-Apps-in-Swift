//
//  ViewController.swift
//  day3-video-play
//
//  Created by 范清龙 on 2019/2/24.
//  Copyright © 2019 范清龙. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {

    
    let dataArray = [videoData(image: "pic1", title: "最新时事政治", time: "2：30s， 腾讯视频"),
                     videoData(image: "pic2", title: "流量小生", time: "1：42s 爱奇艺"),
                     videoData(image: "pic3", title: "最美的美女就在这里啊", time: "5：34s YouTube"),
                     videoData(image: "pic4", title: "这个帅哥是真的帅啊", time: "3：32s 土豆网"),
                     videoData(image: "pic5", title: "这个是你想要的东西哦", time: "6：34s   pronhub"),]
    //播放视频
    var palyVC = AVPlayerViewController()
    var player = AVPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Video play"
        self.view.addSubview(videoTable)
    }

    
    func palyVideo () -> Void {
        let path = Bundle.main.path(forResource: "emoji zone", ofType: "map4")
        player = AVPlayer(url: URL.init(fileURLWithPath: path ?? ""))
        palyVC.player = player
        
        // 知识点：尾随闭包
        // 在使用尾随闭包时，你不用写出它的参数标签
        // 如果闭包表达式是函数或方法的唯一参数，则当你使用尾随闭包时，你甚至可以把 () 省略掉
        // 完整形式如下：
        self.present(palyVC, animated: true) {
            self.palyVC.player?.play()
        }
    }
    
    
    //MARK: lazy
    lazy var videoTable: UITableView = {
        let table = UITableView(frame: self.view.frame, style: .plain)
        table.register(VideoCell.self, forCellReuseIdentifier: "cell")
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        return table
    }()
}

//MARK: swfit 扩展， 类似OC的g分类，但是没有名称
//可以添加新功能，但是不能复写旧的功能
// 扩展可以添加新的计算型属性，但是不可以添加存储型属性，也不可以为已有属性添加属性观察器。
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    // 知识点：向下转型
    // as! 强制类型转换，无法转换时会抛出运行时异常
    // as？可选类型转换，无法转换时返回nil
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! VideoCell
        let video = self.dataArray[indexPath.row]
        cell.backImage.image = UIImage(named: video.image)
        cell.titleLabel.text = video.title
        cell.timeLabel.text = video.time
        return cell
    }
    
}
