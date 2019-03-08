//
//  ViewController.swift
//  day11-GradeLayerColor
//
//  Created by FQL on 2019/3/8.
//  Copyright © 2019 FQL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    private let dataString = "今天公元2019年3月8日，是一个很特别的日子，既是男人的节日，也是女人的节日，农历二月二龙抬头，阳历38妇女节，还有一个也可以记录下，今天是股市收割的日子，2019开年牛市跑步入场，两周的工作被今天一天收割完了，杀人不见血，国家队还真是厉害d=====(￣▽￣*)b厉害，敬畏市场，股市有风险，入市须谨慎啊"
    var dataArray: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.black
        self.dataArray = dataString.components(separatedBy: "，")
        self.view.addSubview(mainCollectionView)
        
    }

    lazy var mainCollectionView: UICollectionView = {
        let layOut = UICollectionViewFlowLayout.init()
        layOut.itemSize = CGSize(width: self.view.frame.width, height: 60)
        layOut.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layOut.minimumLineSpacing = 0.0
        layOut.minimumInteritemSpacing = 0
        let collection = UICollectionView(frame: self.view.frame, collectionViewLayout: layOut)
        collection.backgroundColor = UIColor.white
        collection.delegate = self
        collection.dataSource = self
        collection.register(DetailCollectionViewCell.self, forCellWithReuseIdentifier: "detailCell")
        return collection
    }()

}


extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        ///MARK: as!DetailCollectionViewCell
        let detailCell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailCell", for: indexPath) as! DetailCollectionViewCell
        detailCell.fillContentLabel(string: self.dataArray[indexPath.row],count: self.dataArray.count)
        return detailCell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let count = CGFloat(self.dataArray.count / (indexPath.row + 1)) * 0.5
        cell.backgroundColor = UIColor(red: count, green: count, blue: 0.5, alpha: 1)
    }
}
