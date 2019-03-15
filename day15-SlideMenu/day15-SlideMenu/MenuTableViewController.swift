//
//  MenuTableViewController.swift
//  day15-SlideMenu
//
//  Created by FQL on 2019/3/15.
//  Copyright © 2019 FQL. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {

    let dataArray = ["Popular", "Fashion", "Dark", "Light"]
    
    var currentSelectItem = "Popular"
    let selectRow = 0

    
    
    /// MARK: UITableViewController 纯代码实现，也可以重新初始化实现。
//    override init(style: UITableView.Style) {
//        super.init(style: style)
//        self.tableView = UITableView(frame: self.view.frame, style: UITableView.Style.plain)
//        self.tableView.delegate = self
//        self.tableView.dataSource = self
//        self.tableView.register(UITableViewCell.self , forCellReuseIdentifier: "cell")
//        
//        if selectRow  == self.tableView.indexPathForSelectedRow?.row{
//            currentSelectItem = self.dataArray[selectRow]
//        }
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
    
    
    
    /// MARK： 设置相应的tableView 注册cell
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView = UITableView(frame: self.view.frame, style: UITableView.Style.plain)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self , forCellReuseIdentifier: "cell")
        
        if selectRow  == self.tableView.indexPathForSelectedRow?.row{
            currentSelectItem = self.dataArray[selectRow]
        }
    }


    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = self.dataArray[indexPath.row]
        cell.textLabel?.textColor = self.dataArray[indexPath.row] == currentSelectItem ? UIColor.black : UIColor.lightGray
        cell.textLabel?.shadowColor = UIColor.black
        cell.selectedBackgroundView?.backgroundColor = UIColor.init(white: 0, alpha: 0.7)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentSelectItem = self.dataArray[indexPath.row]
        tableView.reloadData()
    }

    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
