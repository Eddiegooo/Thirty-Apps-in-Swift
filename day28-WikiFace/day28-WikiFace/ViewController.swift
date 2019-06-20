//
//  ViewController.swift
//  day28-WikiFace
//
//  Created by FQL on 2019/4/4.
//  Copyright © 2019 FQL. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var wikiImageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.addSubview(self.textField)
        let imageView = UIImageView(frame: CGRect(x: 30, y: 150, width: self.view.frame.size.width - 60, height: self.view.frame.size.height - 200))
        imageView.backgroundColor = UIColor.white
        self.wikiImageView = imageView
        self.view.addSubview(imageView)
        
        let set = testFunc(name: "Qin Banxian")
        print(set)
        
        //交互两个参数的值
        var count = 3, second = 4
        swapCount(&count, &second)
    }
    
    
    func testFunc (name firstParam: String, age: Int = 30) -> [Int] {
        print("qin qianyan = \(firstParam) + age:= \(age)")
        let age: Int = 30
        let sex: Int = 1
        
        return [age, sex]
    }

    func addFunc (count paramer: Int...) -> Double {
        return Double(paramer[0] + 3)
    }
    
    //本来参数是不可以变化的。  如果想修改l某个值， 就要加上inout修饰
    // MARK: 输入输出参数不能有默认值，而且可变参数不能用 inout 标记。
    func swapCount (_ first: inout Int, _ second: inout Int) {
        let temp = first
        first = second
        second = temp
        
    }
    
    
    /// MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        return true
    }
    
    lazy var textField: UITextField = {
        let text = UITextField(frame: CGRect(x: 20, y: 80, width: self.view.frame.size.width - 50, height: 40))
        text.textColor = UIColor.blue
        text.borderStyle = UITextBorderStyle.roundedRect
        text.placeholder = "Please enter you want to search"
        text.delegate = self as UITextFieldDelegate
        return text
    }()
    
    

}

