//
//  ViewController.swift
//  Day1
//
//  Created by FQL on 2019/2/21.
//  Copyright © 2019 FQL. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var count: Int = 0
    var timer = Timer()
    
    
    let nameArray = ["start", "stop", "resert"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.timeLabel)
        
        for index in (0...2) {
            let btn = UIButton(type: .custom)
            btn.frame = CGRect(x: 80 + index * 100, y: 150, width: 80, height: 35)
            btn.setTitle(nameArray[index], for: .normal)
            btn.setTitleColor(.black, for: .normal)
            btn.backgroundColor = UIColor.cyan
            btn.tag = index + 666
            btn.addTarget(self, action: #selector(controlTimeLabel(btn:)), for: .touchUpInside)
            self.view.addSubview(btn)
        }
        
        self.view.addSubview(self.tableView)
        self.view.addSubview(self.changeItemButton)
    }

    //MARK: - funcs Events
    @objc func controlTimeLabel(btn: UIButton) -> Void {
        let index = btn.tag - 666
        if index == 0 {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(changeLabelText), userInfo: nil, repeats: true)
            timer.fire()
        }
        if index == 1 {
            timer.fireDate = Date.distantFuture
            self.timeLabel.text = "time count: \(count)"
        }
        if index == 2 {
            timer.invalidate()
            count = 0
            self.timeLabel.text = "time count: \(count)"
        }
    }
    
    @objc func changeLabelText() {
        count+=1
        self.timeLabel.text = "time count: \(count)"
    }
    
    @objc func changeItemLabelState() {
        self.tableView.reloadData()
    }
    
    // MARK: - tableView delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = nameArray[indexPath.row]
        // swift 随机数这里好烦
        let index = Int(arc4random_uniform(UInt32(UIFont.familyNames.count)))+0
       let nameStr =  UIFont.familyNames[index]
        cell?.textLabel?.font = UIFont(name: nameStr, size: 25)
        return (cell ?? nil)!
    }
    
    // MARK: Lazy init
    lazy var timeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 80, width: 300, height: 30))
        label.text = "time clock: \(count)"
        label.textColor = UIColor.red
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()

    
    lazy var tableView: UITableView = {
        let table = UITableView(frame: CGRect(x: 0, y: 200, width: self.view.frame.size.width, height: self.view.frame.height - 300), style: .plain)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.delegate = self as UITableViewDelegate
        table.dataSource = self as UITableViewDataSource
        return table
    }()
    
    
    lazy var changeItemButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: self.view.frame.width / 2 - 30, y: self.view.frame.height - 100, width: 60, height: 60)
        btn.setTitle("change", for: .normal)
        btn.setTitleColor(.yellow, for: .normal)
        btn.layer.cornerRadius = 30
        btn.layer.masksToBounds = true
        btn.backgroundColor = UIColor.lightGray
        btn.addTarget(self, action: #selector(changeItemLabelState), for: .touchUpInside)
        return btn
    }()
}

