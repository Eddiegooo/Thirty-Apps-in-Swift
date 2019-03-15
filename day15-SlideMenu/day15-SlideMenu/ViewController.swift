//
//  ViewController.swift
//  day15-SlideMenu
//
//  Created by FQL on 2019/3/15.
//  Copyright © 2019 FQL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let manager = TransitionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Slide Menu Demo"
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "menu"), style: UIBarButtonItem.Style.done, target: self, action: #selector(clickMenuBtn(item:)))
        
        manager.delegate = self
        self.view.addSubview(mainTable)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    /// TODO: VC transition Animate does not work !!!!
    @objc func clickMenuBtn(item: UIBarButtonItem) {
        /// 这里设置就添加上了转场动画
        let vc = MenuTableViewController()
        vc.transitioningDelegate = manager  //设置这个。。。
        self.present(vc, animated: true, completion: nil)
    }


    
    /// Lazy Init
    lazy var mainTable: UITableView = {
        let table =  UITableView(frame: self.view.frame, style: UITableView.Style.plain)
        table.separatorStyle = .none
        table.register(UITableViewCell.self , forCellReuseIdentifier: "cell")
        table.delegate = self
        table.dataSource = self
        return table
    }()
}



extension ViewController: UITableViewDelegate, UITableViewDataSource, ViewControllerTransitionDelegate {
    
    func dismissViewControler() {
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = "index path \(indexPath.row)"
        cell?.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        cell?.textLabel?.textColor = UIColor.black
        return (cell ?? nil)!
    }
    
}

