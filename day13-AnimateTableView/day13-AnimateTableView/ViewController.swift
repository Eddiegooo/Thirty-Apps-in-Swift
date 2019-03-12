//
//  ViewController.swift
//  day13-AnimateTableView
//
//  Created by FQL on 2019/3/12.
//  Copyright © 2019 FQL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var dataArray: Array<String> = ["index Path row","index Path row","index Path row","index Path row","index Path row","index Path row"]
    
    var rightItem: UIBarButtonItem?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "View Controller"
        self.view.backgroundColor = UIColor.black
        self.view.addSubview(mainTable)
        
        rightItem = UIBarButtonItem(title: "Edit", style: UIBarButtonItem.Style.done, target: self, action: #selector(editTableView))
        self.navigationItem.leftBarButtonItem = rightItem
        
    }
    
    /// 是否在编辑状态
    @objc func editTableView() {
        mainTable.isEditing = !mainTable.isEditing
        if mainTable.isEditing {
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(editTableView))
        }else {
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Edit", style: UIBarButtonItem.Style.done, target: self, action: #selector(editTableView))
        }
    }
    

    lazy var mainTable : UITableView = {
        let table = UITableView(frame: self.view.frame, style: .plain)
        table.register(UITableViewCell.self , forCellReuseIdentifier: "tableCell")
        table.delegate = self
        table.dataSource = self
        return table
    }()

}


extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "tableCell")
        tableCell?.textLabel?.text = self.dataArray[indexPath.row] + "\(indexPath.row)"
        return tableCell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = AnimateViewController()
        ///要想设置界面半透明， 要这么做属性
//        vc.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
//        vc.modalPresentationStyle = .overCurrentContext
        //转场动画
        vc.modalTransitionStyle = .coverVertical
        self.present(vc, animated: true, completion: nil)
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //删除数据
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if indexPath.row < self.dataArray.count {
            self.dataArray.remove(at: indexPath.row)
            self.mainTable.reloadData()
        }
    }
    
}

