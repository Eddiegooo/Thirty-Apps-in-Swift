//
//  leftVIew.swift
//  day7-SimpleCamera
//
//  Created by FQL on 2019/3/4.
//  Copyright © 2019 FQL. All rights reserved.
//

import UIKit


typealias cameraClick = () -> Void
typealias libsClick = () -> Void

class leftVIew: UIView {

    var cameraBlock: cameraClick!
    var libsBlock: libsClick!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.addSubview(self.cameraBtn)
        self.addSubview(self.libsBtn)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc func cameraBtnClick() {
        if self.cameraBlock != nil {
            self.cameraBlock()
        }
    }
    
    @objc func libsBtnClick() {
        if self.libsBlock != nil {
            self.libsBlock()
        }
    }
    
    lazy var cameraBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 0, y: 100, width: 300, height: 40)
        btn.setTitle("camera", for: .normal)
        btn.setTitleColor(.red, for: .normal)
        btn.backgroundColor = UIColor.lightGray
        btn.addTarget(self, action: #selector(cameraBtnClick), for: .touchUpInside)
        return btn
    }()
    
    lazy var libsBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 0, y: 150, width: 300, height: 40)
        btn.setTitle("libs", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = UIColor.cyan
        btn.addTarget(self, action: #selector(libsBtnClick), for: .touchUpInside)
        return btn
    }()
    
}
