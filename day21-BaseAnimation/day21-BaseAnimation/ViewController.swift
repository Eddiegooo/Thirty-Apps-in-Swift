//
//  ViewController.swift
//  day21-BaseAnimation
//
//  Created by FQL on 2019/3/29.
//  Copyright © 2019 FQL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let dataSource = ["basic", "liner", "rotation", "scale" , "alpha"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.addSubview(mainTable)
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

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL")
        cell?.textLabel?.text = self.dataSource[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            self.navigationController?.pushViewController(AnimationViewController(), animated: true)
        case 1:
            self.navigationController?.pushViewController(LineViewController(), animated: true)
        case 2:
            self.navigationController?.pushViewController(RotationViewController(), animated: true)
        case 3:
            self.navigationController?.pushViewController(ScaleViewController(), animated: true)
        case 4:
            self.navigationController?.pushViewController(AlphaViewController(), animated: true)
        default:
            return
        }
    }
    
}
