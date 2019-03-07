//
//  ViewController.swift
//  day10-PlayVideo
//
//  Created by FQL on 2019/3/7.
//  Copyright © 2019 FQL. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    
    private let titleString = "when i was young i'd listen to the radio,waiting for my favorite songs,when they played i'd sing along,it make me smile,Play Video"
    var dataArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataArray = titleString.components(separatedBy: ",")
        
        self.view.addSubview(self.headView)
        self.view.addSubview(self.mainTable)
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.mainTable.reloadData()
        
        let cellArray = self.mainTable.visibleCells
        for (index, cell) in cellArray.enumerated() {
            cell.frame.origin.y = mainTable.frame.height
            UIView.animate(withDuration: 0.5, delay: 0.25 * Double(index), usingSpringWithDamping: 0.6, initialSpringVelocity: 0.75, options: UIView.AnimationOptions.curveEaseIn, animations: {
                cell.frame.origin.y = self.view.frame.width + 10
            }, completion: nil)
        }
    }
    
    ///这种很简单，但是有弊端。 没有控制按键，要自己添加，然后添加对应的事件.  播放完了还得移除视图。 用通知方法
    //定义一个playerItem，并监听相关的通知
//    let playerItem = AVPlayerItem(url: videoURL)
//    NotificationCenter.default.addObserver(self,
//    selector: #selector(playerDidFinishPlaying),
//    name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
//    object: playerItem)
    func AVplayLayerPlayVideo() {
//        let filePath = Bundle.main.path(forResource: "moments", ofType: "mp4")
//        let url = URL.init(fileURLWithPath: filePath!)
//        let avPlayer = AVPlayer(url: url)
//        let playLayer = AVPlayerLayer(player: avPlayer)
//        playLayer.frame = self.view.frame
//        self.view.layer.addSublayer(playLayer)
//        avPlayer.play()
    }
    
    ///用VC方式  系统自带控制按键  CMTime 播放时间等
    func AVPlayViewControllerPlayVideo() {
        let filePath = Bundle.main.path(forResource: "moments", ofType: "mp4")
        let url = URL.init(fileURLWithPath: filePath!)
        let avPlayer = AVPlayer(url: url)
        avPlayer.rate = 1.0 //播放速度
        
        let playVC = AVPlayerViewController.init()
        playVC.player = avPlayer
        self.present(playVC, animated: true, completion: nil)
    }
    
    lazy var mainTable : UITableView = {
        let table = UITableView(frame: CGRect(x: 0, y: self.view.frame.width + 10, width: self.view.frame.width, height: self.view.frame.height - self.view.frame.width - 10), style: .plain)
        table.register(UITableViewCell.self , forCellReuseIdentifier: "cell")
        table.delegate = self
        table.dataSource = self
        table.tableFooterView = UIView.init()
        return table
    }()

    lazy var headView: UIImageView = {
        let img = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.width))
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "meinv")
        return img
    }()
    
}


extension ViewController : UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = self.dataArray[indexPath.row]
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        ///MARK:s两种方法获取cell  对应两种方法播放视频
        //1.直接使用AVPlayerLayer
        let cell = tableView.cellForRow(at: indexPath)
        if cell?.textLabel?.text == "Play Video" {
            print("play 1 VIdeo")
            AVplayLayerPlayVideo()
        }
        
        if indexPath.row == self.dataArray.count - 1 {
            print("Play Video")
            AVPlayViewControllerPlayVideo()
        }
    }
    ///MARK: 拖拽tableView  顶部View跟着变化frame
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let maxOffsetY = mainTable.frame.height
        let validateOffsetY =  -offsetY / maxOffsetY
        let scaleFactor = 1 + validateOffsetY
        headView.transform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
    }
    
}
