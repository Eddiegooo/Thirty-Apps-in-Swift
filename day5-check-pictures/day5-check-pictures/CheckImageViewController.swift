//
//  CheckImageViewController.swift
//  day5-check-pictures
//
//  Created by FQL on 2019/3/1.
//  Copyright © 2019 FQL. All rights reserved.
//

import UIKit

class CheckImageViewController: UIViewController, UIScrollViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.clear
        self.view.addSubview(self.backScrollView)
        self.backScrollView.addSubview(self.imageView)
        
    }
    
    
    func checkImageView (img: UIImage) -> Void {
        self.imageView.image = img
    }
    
    
    @objc func disMissVC() {
        self.dismiss(animated: true, completion: nil)
    }
    
    //双击方大
    @objc func doubleClickImage() {
        let zome = self.backScrollView.zoomScale;
        if zome <= 1.0{
            self.backScrollView.setZoomScale(2.0, animated: true)
        }else{
            self.backScrollView.setZoomScale(1.0, animated: true)
        }
    }
    
    //手动啮合方大是缩小。 很简单啊
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
    
    
    lazy var backScrollView: UIScrollView = {
        let view = UIScrollView(frame: self.view.frame)
        view.maximumZoomScale = 4.0
        view.minimumZoomScale = 0.5
        view.contentSize = self.view.frame.size
        view.delegate = self
        return view
    }()

    lazy var imageView: UIImageView = {
        let imageV = UIImageView(frame: self.view.frame)
        imageV.isUserInteractionEnabled = true
        imageV.addGestureRecognizer(self.singleTap)
        imageV.addGestureRecognizer(self.doubleTap)
        return imageV
    }()
    
    
    lazy var singleTap: UITapGestureRecognizer = {
        let tap = UITapGestureRecognizer(target: self, action: #selector(disMissVC))
        tap.numberOfTapsRequired = 1
        tap.require(toFail: self.doubleTap)
        return tap
    }()
    
    lazy var doubleTap: UITapGestureRecognizer = {
        let double = UITapGestureRecognizer(target: self, action: #selector(doubleClickImage))
        double.numberOfTapsRequired = 2
        return double
    }()
    
}
