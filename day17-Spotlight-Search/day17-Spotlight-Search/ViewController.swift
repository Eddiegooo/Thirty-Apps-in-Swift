//
//  ViewController.swift
//  day17-Spotlight-Search
//
//  Created by FQL on 2019/3/21.
//  Copyright © 2019 FQL. All rights reserved.
//

import UIKit
import CoreSpotlight


///  SpotLight 系统自动实现了搜索应用功能。 也支持模糊搜索。
/// 本次主要做的是实现搜索应用内消息以及跳转。

/**
 1.导入 CoreSpotlight。
 2.添加可以搜索的内容
 */
class ViewController: UIViewController {
    
    let dataArray = [
        [
        "title" : "Cell Title",
        "detail" : "Details - you are a handsome man, wo ye bu neng xihuan ni"
        ],
        [
            "title" : "Cell Title",
            "detail" : "Details - you are beautiful woman. hai zhen shi xi huan mei zi"
        ],
        [
            "title" : "Cell Title",
            "detail" : "Details - you are a bitch. shut up. go out gun. bitch "
        ]
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.title = "Main View";
        self.view.addSubview(mainTable)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(transferToSpotlight(sender:)), name: NSNotification.Name(rawValue: "spotlight"), object: nil)
        
        /// 删除spotlight.  这里有几个方法，可以逐条删除
//        CSSearchableIndex.default().deleteAllSearchableItems { (error) in
//            print("删除所有的Spotlight")
//        }
    }
    
    
    //跳转处理
    @objc func transferToSpotlight(sender: Notification) {
        let value = sender.userInfo
        let index = Int(value?["value"] as! String)
        let detailVC = DetailViewController()
        detailVC.detailString = self.dataArray[index ?? 0]["detail"]
        detailVC.imageName = "image" + (value?["value"] as! String)
        self.navigationController?.pushViewController(detailVC, animated: true)
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

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "CELL")
        cell.textLabel?.text = self.dataArray[indexPath.row]["title"]
        cell.detailTextLabel?.text = self.dataArray[indexPath.row]["detail"]
        cell.imageView?.image = UIImage(named: "image\(indexPath.row)")
        
        ///添加 Spotlight
        //1.这个可以设置多个
        let searchAttrite = CSSearchableItemAttributeSet(itemContentType: "search")//type 是啥都可以的么?
        /// 下面都是模糊匹配的。 都可以搜索得到
        searchAttrite.title = self.dataArray[indexPath.row]["title"]
        searchAttrite.contentDescription = self.dataArray[indexPath.row]["detail"]
        searchAttrite.keywords = ["man","woman","bitch"] //关键字  可以搜索这些来找到对应的
//        searchAttrite.thumbnailData  //设置搜索的条目图片，不设置显示APP icon图片
//        searchAttrite.thumbnailURL //也可以用这个设置， 但是必须是本地图片地址
        
        //2.对应上面几个
        //UniqueIdentifier每个搜索都有一个唯一标示，当用户点击搜索到得某个内容的时候，系统会调用代理方法，会将这个唯一标示传给你，以便让你确定是点击了哪一个，方便做页面跳转
        //domainIdentifier搜索域标识，删除条目的时候调用的delegate会传过来这个值
        let searchItem = CSSearchableItem(uniqueIdentifier: "\(indexPath.row)", domainIdentifier: "mainSearch", attributeSet: searchAttrite)
        let items = [searchItem]
        CSSearchableIndex.default().indexSearchableItems(items) { (error) in
            if (error != nil) {
                print("添加失败了 \(error ?? "error" as! Error)")
            }else {
                print("添加 成功了")
            }
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailVC = DetailViewController()
        detailVC.detailString = self.dataArray[indexPath.row]["detail"]
        detailVC.imageName = "image\(indexPath.row)"
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}

