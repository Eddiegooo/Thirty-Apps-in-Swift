//
//  ViewController.swift
//  day24-ImageScroll
//
//  Created by FQL on 2019/4/1.
//  Copyright © 2019 FQL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let imageArray = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = .black
        self.view.addSubview(customCollectionView)
        self.view.addSubview(pageControl)
    }

    // 怎么知道点击了第几个？？？求d告知啊。。。。  系统是点击一下，自动加1的。。。。   这么小基本没人会去点吧。。。
    @objc func pageControlChange(control: UIPageControl) {
        
    }
    
    
    lazy var customCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: self.view.frame.width, height: 600)
        let collectView = UICollectionView(frame: CGRect(x: 0, y: self.view.frame.height / 2 - 300, width: self.view.frame.width, height: 600), collectionViewLayout: layout)
        collectView.showsHorizontalScrollIndicator = false
        collectView.isPagingEnabled = true
        collectView.delegate = self
        collectView.dataSource = self
        collectView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "CELL")
        return collectView
    }()
    

    /// 样式不用系统的 只能自定义？？？？
    lazy var pageControl: UIPageControl = {
        let control = UIPageControl(frame: CGRect(x: 20, y:  self.customCollectionView.frame.maxY - 30, width: self.view.frame.width - 40, height: 30))
        control.numberOfPages = self.imageArray.count
        control.currentPage = 0;
        control.isUserInteractionEnabled = true
        control.addTarget(self, action: #selector(pageControlChange(control:)), for: UIControl.Event.valueChanged)
        return control
    }()
}


extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout ,UIScrollViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imageArray.count
    }
    
    /// 翻页会出现间隔距离累加？？？？
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CELL", for: indexPath) as! ImageCollectionViewCell
        cell.fillContentWithImage(imageString: self.imageArray[indexPath.row])
        return cell
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == customCollectionView {
            let width : Int = Int(self.view.frame.width)
            self.pageControl.currentPage = Int(scrollView.contentOffset.x) / width
            if Int(scrollView.contentOffset.x) > width * (self.imageArray.count-1) {
                scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: false)
            }
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
    }
    
}
