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
    
    var dataSource = Array<NameList>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.title = "Core Data Demo"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "+", style: UIBarButtonItem.Style.done, target: self, action: #selector(addData))
        self.view.addSubview(mainTable)
        
        deleCoreData()
        
        updateCoreData()
        mainTable.reloadData()
    }
    
    //删除数据。。
    func deleCoreData () -> Void {
        let content = getCoreData()
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "NameList")
        do {
            let results = try content.fetch(fetchRequest)
            dataSource = results as! [NameList]
            for item in dataSource {
                content.delete(item)
            }
        } catch  {
            print(error)
        }
    }
    
    //MARK: Private Evenets
    func getCoreData () -> NSManagedObjectContext {
        let appDele = UIApplication.shared.delegate as! AppDelegate
        return appDele.container.viewContext
    }
    // 保存数据
    func saveData(string: String) -> Void {
        let content = getCoreData()
        // 注意： 这个EntityName 不要写错了。。 这个和你创建表的那个一样。  说是首字母要大写呢。。。
        let entiry = NSEntityDescription.entity(forEntityName: "NameList", in: content)
        
        let nameList = NSManagedObject(entity: entiry!, insertInto: content)
        // 注意： 这个key name 要和你创建表的时候添加的那个key一致..
        nameList.setValue(string, forKey: "name")
        
        do {
            try content.save()
        } catch {
            print(error)
        }
    }
    
    //更新数据
    func updateCoreData() -> Void {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "NameList")
        do {
            let results = try getCoreData().fetch(fetchRequest)
            dataSource = results as! [NameList]
        } catch  {
            print(error)
        }
    }
   
    // MARK: Events
    @objc func addData() {
        
        let alertVC = UIAlertController(title: "Add New Data", message: nil, preferredStyle: UIAlertController.Style.alert)
        alertVC.addTextField { (textField) in
            textField.placeholder = "add data"
        }
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (okAction) in
            //获取输入的内筒， 保存、刷新数据
            let textField = alertVC.textFields![0]
            self.saveData(string: textField.text!)
            self.updateCoreData()
            self.mainTable.reloadData()
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
        cell?.textLabel?.text = self.dataSource[indexPath.row].name
        return cell!
    }
}

