//
//  SecondViewController.swift
//  day30—Swift5-New-Program
//
//  Created by FQL on 2019/4/11.
//  Copyright © 2019 FQL. All rights reserved.
//

import UIKit

typealias tmpClose = (String) -> Void

class SecondViewController: UIViewController {

    var block: tmpClose?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        block = {(str: String) -> Void in
            print(str)
        }
        block!("block")
        // Do any additional setup after loading the view.
        
        testBlock()
    }
    
    
    func testBlock () -> Void {
        if self.block != nil {
            self.block?("test")
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
