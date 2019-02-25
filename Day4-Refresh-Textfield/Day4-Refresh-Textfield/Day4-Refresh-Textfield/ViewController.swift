//
//  ViewController.swift
//  Day4-Refresh-Textfield
//
//  Created by FQL on 2019/2/25.
//  Copyright © 2019 FQL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var dataArray: [String] = []
    var refresh = UIRefreshControl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataArray = ["this is first Data", "second data", "Third data"]
       
        self.view.addSubview(self.table)

        refresh.attributedTitle = NSAttributedString(string: "在拉裤子就掉了")
        refresh.tintColor = UIColor.red
        refresh.addTarget(self, action: #selector(refreshData), for: UIControl.Event.valueChanged)
        table.addSubview(refresh)
        table.reloadData()
    }

    //MARK: 刷新加载数据有BUG
    @objc func refreshData() {
        self.dataArray.insert("i am new data", at: 1)
        refresh.endRefreshing()
        self.table.reloadData()
    }
    
    lazy var table: UITableView = {
        let table = UITableView(frame: self.view.bounds, style: .plain)
        table.register(DetailCell.self, forCellReuseIdentifier: "cell")
        table.delegate = self
        table.dataSource = self
        return table
    }()

}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! DetailCell
        cell.inputTextField.text = self.dataArray[indexPath.row]
        return cell
    }
    
    
}
