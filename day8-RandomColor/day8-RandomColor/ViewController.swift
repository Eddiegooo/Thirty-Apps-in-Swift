//
//  ViewController.swift
//  day8-RandomColor
//
//  Created by FQL on 2019/3/4.
//  Copyright © 2019 FQL. All rights reserved.
//

import UIKit
import SnapKit
import AVFoundation

class ViewController: UIViewController {

    var mp3Player = AVAudioPlayer()
    ///处理图层渐变
    let caniteLayer = CAGradientLayer()
    
    var playTimer : Timer?
    
    
    var backGroundColor: (red: CGFloat, yellow: CGFloat, blue: CGFloat)! {
        didSet {
            let color1 = UIColor(red: backGroundColor.red, green: backGroundColor.yellow, blue: backGroundColor.blue, alpha: 1).cgColor
            let color2 = UIColor(red: backGroundColor.red, green: backGroundColor.yellow, blue: 1, alpha: 1).cgColor
            caniteLayer.colors = [color1, color2]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        caniteLayer.frame = self.view.frame
        caniteLayer.startPoint = CGPoint(x: 0, y: 0)
        caniteLayer.endPoint = CGPoint(x: 1, y: 1)
        self.view.layer.addSublayer(caniteLayer)
        
        self.view.addSubview(self.playBtn)
        self.playBtn.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.view).offset(-50)
            make.centerX.equalTo(self.view)
            make.size.equalTo(CGSize(width: 50, height: 50))
        }
        
        playTimer = Timer.scheduledTimer(timeInterval: 0.35, target: self, selector: #selector(changeBackGroundColor), userInfo: nil, repeats: true)
        
    }
    
    /// 隐藏顶部状态栏。  需要首先在infoPlist里设置View controller-based status bar appearance 为YES
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //MARK: Events
    @objc func changeBackGroundColor() {
        let redValue = CGFloat(drand48())
        let blueValue =  CGFloat(drand48())
        let greenValue = CGFloat(drand48())
        
        backGroundColor = (redValue, blueValue, greenValue)
    }
    
    @objc func playMp3() {
        let filePath = Bundle.main.path(forResource: "Ecstasy", ofType: "mp3")
        let fileUrl = URL(fileURLWithPath: filePath!)
        
        //音频播放必须用do catch。。
        do {
            //MARK: AVAudioSession 激活音频。 设置音频播放的一些方式
            if #available(iOS 11.0, *) {
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, policy: .default, options: .allowAirPlay)
            } else {
                // Fallback on earlier versions
            }
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            
            ///音频播放
            try mp3Player = AVAudioPlayer(contentsOf: fileUrl)
            mp3Player.prepareToPlay()
            mp3Player.play()
        } catch let error as NSError {
            print(error)
        }
    }
    
    
    
    //MARK: Init
    lazy var playBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "play"), for: .normal)
        btn.addTarget(self, action: #selector(playMp3), for: .touchUpInside)
        return btn
    }()


}

