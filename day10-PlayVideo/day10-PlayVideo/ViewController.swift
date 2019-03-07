//
//  ViewController.swift
//  day10-PlayVideo
//
//  Created by FQL on 2019/3/7.
//  Copyright © 2019 FQL. All rights reserved.
//

import UIKit

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
        
        let cell = tableView.cellForRow(at: indexPath)
        if cell?.textLabel?.text == "Play Video" {
            print("play 1 VIdeo")
        }
        
        if indexPath.row == self.dataArray.count - 1 {
            print("Play Video")
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
