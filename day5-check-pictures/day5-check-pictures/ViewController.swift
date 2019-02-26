//
//  ViewController.swift
//  day5-check-pictures
//
//  Created by FQL on 2019/2/26.
//  Copyright © 2019 FQL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    // 访问权限分五种：private，fileprivate，internal，public 和 open
    // private：只能在本类的作用域且在当前文件内能访问
    // fileprivate：只能在当前文件内能访问
    // internal：本module内能访问
    // public：跨module访问但不能重写或继承
    // open：跨module访问并且能重写或继承
    
    fileprivate let dataArray = DataModel.createDataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.backgroundImage)
        self.view.addSubview(self.picCollectionView)
    }

    
    lazy var backgroundImage: UIImageView = {
        let image = UIImageView(frame: self.view.frame)
        image.image = UIImage(named: "back")
        return image
    }()
    
    lazy var picCollectionView: UICollectionView = {
        let layout = UICollectionViewLayout.init()
        let collView = UICollectionView(frame: CGRect(x: 0, y: 200, width: self.view.frame.width, height:self.view.frame.width), collectionViewLayout: layout)
        collView.register(PictureCell.self, forCellWithReuseIdentifier: "cell")
        collView.delegate = self
        collView.dataSource = self
        return collView
    }()
    

}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int  {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PictureCell
        cell.fillContentWithModel(model: self.dataArray[indexPath.row])
        return cell
    }
    
    
}

