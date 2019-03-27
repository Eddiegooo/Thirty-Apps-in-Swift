//
//  ViewController.swift
//  day19-Custom-Refresh
//
//  Created by FQL on 2019/3/22.
//  Copyright © 2019 FQL. All rights reserved.
//

import UIKit

/// 思路：首先获取到刷新控件UIRefreshControl， 自定义View
//  实际上这里要做一个功能完整的自定义刷新控件，还比较复杂。 考虑的情况还比较多。

class ViewController: UIViewController {

    var customRefreshView : UIView!
    var refreshControl : UIRefreshControl!
    
    var refreshLabel : UILabel!
    
    
    var dataArray = ["😆", "🙄", "d/(ㄒoㄒ)/~~", "😄", "😓"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        refreshControl = UIRefreshControl()
        refreshControl.backgroundColor = .clear
        refreshControl.tintColor = .clear
        mainTable.addSubview(refreshControl)
        self.view.addSubview(mainTable)
        
        getCustomRefreshControl()
    }

    // MARK: 自定义刷新视图
    func getCustomRefreshControl() -> Void {
        customRefreshView = UIView(frame: refreshControl.bounds)
        refreshLabel = UILabel(frame: customRefreshView.frame)
        refreshLabel.text = "pull refresh"
        refreshLabel.textColor = .black
        refreshLabel.font = UIFont.systemFont(ofSize: 13)
        refreshLabel.textAlignment = .center
        customRefreshView.addSubview(refreshLabel)
        refreshControl.addSubview(customRefreshView)
    }
    
    
    lazy var mainTable: UITableView = {
        let table = UITableView(frame: self.view.frame, style: UITableView.Style.plain)
        table.register(UITableViewCell.self , forCellReuseIdentifier: "CELL")
        table.delegate = self
        table.dataSource = self
        table.tableFooterView = UIView.init()
        return table
    }()

}


extension ViewController: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL")
        cell?.textLabel?.text = self.dataArray[indexPath.row]
        cell?.textLabel?.textAlignment = .center
        return cell!
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("Stop Drag, Start Refresh")
        
        //延迟2s执行
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.refreshControl.endRefreshing()
        }
        
    }
    
    
}
