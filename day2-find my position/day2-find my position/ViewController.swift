//
//  ViewController.swift
//  day2-find my position
//
//  Created by 范清龙 on 2019/2/23.
//  Copyright © 2019 范清龙. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let loationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        ///这里出现一个小插曲，我仿照OC方式，直接将图片拖到工程里，怎么都不显示图片。 查找资料得知，swift要把图片放到Assets -- New image里， 才加载出了图片
        let backImage = UIImageView(frame: self.view.frame)
        backImage.image = UIImage(named: "test")
        self.view.addSubview(backImage)
        
        //放一个模糊视图方式  swift新内容
        let blur = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blur)
        blurView.frame = self.view.frame
        self.view.addSubview(blurView)
        
        self.view.addSubview(self.nameLabel)
        self.view.addSubview(self.locationBtn)

        //定位相关
        loationManager.delegate = self
        
    }

    //MARK: Delegate --  这里代理方法很多啊
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locations : NSArray = locations as NSArray
        let currentLocation = locations.lastObject as! CLLocation
        let locationStr = "lat:\(currentLocation.coordinate.latitude) lng:\(currentLocation.coordinate.longitude)"
        nameLabel.text = locationStr
//        reverseGeocode(location:currentLocation)
        loationManager.stopUpdatingLocation()
    }
    
    //MARK: Events
    @objc func findMyLocation() {
        //获取授权，必须要在infoplist文件里添加对应的描述信息
        /*This app has attempted to access privacy-sensitive data without a usage description. The app's Info.plist must contain both “NSLocationAlwaysAndWhenInUseUsageDescription” and “NSLocationWhenInUseUsageDescription” keys with string values explaining to the user how the app uses this data*/
        loationManager.requestAlwaysAuthorization()
        loationManager.startUpdatingLocation()
    }

    //MARK: Lazy Init
    lazy var nameLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 30, y: 100, width: 300, height: 35))
        label.textColor = .black
        label.textAlignment = .center;
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var locationBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 120, y: self.view.frame.height - 100, width: 200, height: 35)
        btn.setTitle("find location", for: .normal)
        btn.setTitleColor(.red, for: .normal)
        btn.backgroundColor = UIColor.lightGray
        btn.addTarget(self, action: #selector(findMyLocation), for: .touchUpInside)
        return btn
    }()
}

