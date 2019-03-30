//
//  GradientCollectionViewController.swift
//  day23-GradientLayout
//
//  Created by FQL on 2019/3/30.
//  Copyright © 2019 FQL. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class GradientCollectionViewController: UICollectionViewController {

    let imageArray = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        ///注意： 直接继承 UICollectionViewController
        //1. 跳转VC的时候，必须初始化到Layout
        //2. 设置layout， 其他基本不用处理了。 系统自带了
        
        let layOut = UICollectionViewFlowLayout.init()
        layOut.itemSize = CGSize(width: self.view.frame.width / 2.2, height: 300)
        layOut.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layOut.scrollDirection = .vertical
        self.collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layOut)
        self.collectionView.backgroundColor = .cyan
        // Register cell classes
        self.collectionView!.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        // Do any additional setup after loading the view.
        if #available(iOS 11.0, *) {
            self.collectionView?.contentInsetAdjustmentBehavior = .never
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 10
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return imageArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cell.alpha = 0
        
        let imageV = cell.contentView.viewWithTag(666) as! UIImageView
        imageV.image = UIImage(named: "\(indexPath.row)")
        
        //这里做一个cellalpha渐变， 会对性能造成影响啊。  持保留态度。。。
        let delayTime = DispatchTime(uptimeNanoseconds: UInt64(arc4random() % 600) / 1000 * NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: delayTime) {
            UIView.animate(withDuration: 0.8, animations: {
                cell.alpha = 1
            })
        }
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
