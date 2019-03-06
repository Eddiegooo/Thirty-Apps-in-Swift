//
//  ViewController.swift
//  day9-SwipeCell
//
//  Created by FQL on 2019/3/6.
//  Copyright © 2019 FQL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var dataArray: Array<String>!
    
    private let cellHeight: CGFloat = 60
    
    private let textString = "when i was young i'd listen to the radio,waiting for my favorite songs,when they played i'd sing along,it make me smile,those were such happy times and not so long ago,how i wondered where they'd gone,but they're back again just like a long lost friend,all the songs i love so well,every shalala every wo'wo,still shines,every shing-a-ling-a-ling"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataArray = textString.components(separatedBy: ",")
        self.view.addSubview(self.swipeTable)
    }

    //做一个cell展示t动画
    /// 1.在这个方法添加cell动画，不要在cellWillDisPlay 有复用问题
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        /// 2.要先调用releadData  不然没有动画效果。
        swipeTable.reloadData()
        
        let cellArray = self.swipeTable.visibleCells
        let tableHeight = swipeTable.frame.height
        
        for (index, cell) in cellArray.enumerated() {
            cell.frame.origin.y = tableHeight
            
            UIView.animate(withDuration: 2, delay: 0.1 * Double(index), usingSpringWithDamping: 0.75, initialSpringVelocity: 0.1, options: UIView.AnimationOptions.curveEaseIn, animations: {
                cell.frame.origin.y = 0
            }, completion: nil)
        }
        
    }
    
    lazy var swipeTable: UITableView = {
        let table = UITableView(frame: self.view.frame, style: .plain)
        table.register(UITableViewCell.self , forCellReuseIdentifier: "cell")
        table.delegate = self
        table.dataSource = self
        table.tableFooterView = UIView.init()
        return table
    }()
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.cellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = self.dataArray[indexPath.row]
        //给cell加一个渐变色
        let bgView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.cellHeight))
        let layer = CAGradientLayer()
        layer.colors = [UIColor.green.cgColor, UIColor.cyan.cgColor]
        layer.frame = bgView.frame
        bgView.layer.addSublayer(layer)
        cell?.addSubview(bgView)
        cell?.sendSubviewToBack(bgView)
        
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let favAction = UITableViewRowAction(style: UITableViewRowAction.Style.default, title: "fav") { (UITableViewRowAction, IndexPath) in
            print("favorate goods")
        }
        
        let delAction = UITableViewRowAction(style: UITableViewRowAction.Style.normal, title: "del") { (UITableViewRowAction, IndexPath) in
            print("delete goods")
        }
        return [favAction, delAction]
    }
    
}

