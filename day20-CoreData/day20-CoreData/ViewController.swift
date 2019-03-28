//
//  ViewController.swift
//  day20-CoreData
//
//  Created by FQL on 2019/3/28.
//  Copyright © 2019 FQL. All rights reserved.
//

import UIKit
import CoreData

/// 步骤：1.创建CoreData表。2.新建一个Entity， 新建需要存储的字段
//****新建CoreData表， 也可以直接在创建工程的时候勾选创建
class ViewController: UIViewController {
    
    let dataSource = Array<NameList>()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.title = "Core Data Demo"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "+", style: UIBarButtonItem.Style.done, target: self, action: #selector(addData))
        self.view.addSubview(mainTable)
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let appDele = UIApplication.init().delegate as! AppDelegate
        
    }
   
    // MARK: Events
    @objc func addData() {
        
        let alertVC = UIAlertController(title: "Add New Data", message: nil, preferredStyle: UIAlertController.Style.alert)
        alertVC.addTextField { (textField) in
            textField.placeholder = "add data"
        }
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (okAction) in
            //获取输入的内筒， 保存、刷新数据
        }
        let cancelAction = UIAlertAction(title: "cancel", style: UIAlertAction.Style.cancel) { (cancelAction) in
        }
        alertVC.addAction(okAction)
        alertVC.addAction(cancelAction)
        self.present(alertVC, animated: true, completion: nil)
    }
    
    // MARK: Init
    lazy var mainTable: UITableView = {
        let table = UITableView(frame: self.view.frame, style: UITableView.Style.plain)
        table.register(UITableViewCell.self , forCellReuseIdentifier: "CELL")
        table.delegate = self
        table.dataSource = self
        table.tableFooterView = UIView.init()
        return table
    }()

}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL")
        cell?.textLabel?.text = self.dataSource[indexPath.row]["name"]
        return cell!
    }
    
    
}

