//
//  LoginController.swift
//  day12-Animation-pickView
//
//  Created by FQL on 2019/3/11.
//  Copyright © 2019 FQL. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    var pickView = UIPickerView()
    
    var emojiArray = ["😀","😎","😈","👻","🙈","🐶","🌚","🍎","🎾","🐥","🐔"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.cyan
        
        self.view.addSubview(nameText)
        self.view.addSubview(passWord)
        self.view.addSubview(submitBtn)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ///MARK： 要有动画效果，要先设置好frame，在改变frame即可
        UIView.animate(withDuration:1, delay: 0.1, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.75, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.nameText.frame = CGRect(x: 20, y: 100, width: self.view.frame.width - 50, height: 45)
        }, completion: nil)
        
        UIView.animate(withDuration: 1, delay: 0.2, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.75, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.passWord.frame = CGRect(x: 20, y: 200, width: self.view.frame.width - 50, height: 45)
        }, completion: nil)
        
        
        UIView.animate(withDuration: 1, delay: 0.3, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.75, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.submitBtn.frame = CGRect(x: 100, y: self.view.frame.height - 200, width: self.view.frame.width - 200, height: 45)
        }, completion: nil)
    }
    
    
    @objc func submitClick() {
        UIView.animate(withDuration: 1, delay: 0.1, usingSpringWithDamping: 0.6, initialSpringVelocity: 10, options: UIView.AnimationOptions.curveLinear, animations: {
            self.submitBtn.frame = CGRect(x: 80, y: self.view.frame.height - 200, width: self.view.frame.width - 150, height: 45)
            self.submitBtn.isEnabled = false
        }) { (bool) in
            self.submitBtn.isEnabled = true
            self.submitBtn.frame = CGRect(x: 100, y: self.view.frame.height - 200, width: self.view.frame.width - 200, height: 45)
        }
        
        
//        let bounds = self.submitBtn.bounds
//
//        //Animate
//        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: .curveLinear, animations: {
//
//            self.submitBtn.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 40, height: bounds.size.height)
//            self.submitBtn.isEnabled = false
//
//        }, completion: { finished in self.submitBtn.isEnabled = true })
        
        changePickView()
        
        if pickView.selectedRow(inComponent: 0) == pickView.selectedRow(inComponent: 1) && pickView.selectedRow(inComponent: 1) == pickView.selectedRow(inComponent: 2) {
            presentAlertView(msg: "你好棒啊，一下子就中奖了")
        } else {
            presentAlertView(msg: "别气馁，再接再厉 加油")
        }
    }
    
    /// 改变pickVIew的选中
    func changePickView ()  {
        pickView.selectRow(Int(arc4random()) % (self.emojiArray.count - 1), inComponent: 0, animated: true)
        pickView.selectRow(Int(arc4random()) % (self.emojiArray.count - 2), inComponent: 1, animated: true)
        pickView.selectRow(Int(arc4random()) % (self.emojiArray.count - 3) + 1, inComponent: 2, animated: true)
    }
    
    func presentAlertView(msg: String) {
        let alertVC = UIAlertController(title: "Notice", message: msg, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel) { (action) in
            
        }
        alertVC.addAction(action)
        self.present(alertVC, animated: true, completion: nil)
        
    }
    
    lazy var nameText: UITextField = {
        let field = UITextField(frame: CGRect(x: -self.view.frame.width, y: 100, width: self.view.frame.width - 50, height: 45))
        field.borderStyle = .roundedRect
        field.placeholder = "userName"
        field.layer.borderWidth = 1
        field.delegate = self
        field.layer.borderColor = UIColor.black.cgColor
        return field
    }()

    
    lazy var passWord: UITextField = {
        let field = UITextField(frame: CGRect(x: -self.view.frame.width, y: 200, width: self.view.frame.width - 50, height: 45))
        field.borderStyle = .roundedRect
        field.placeholder = "passWord"
        field.layer.borderWidth = 1
        field.delegate = self
        field.layer.borderColor = UIColor.black.cgColor
        return field
    }()
    
    lazy var submitBtn : UIButton = {
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: -self.view.frame.width, y: self.view.frame.height - 140, width: 200, height: 40)
        btn.setTitle("Submit", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.backgroundColor = UIColor.green
        btn.layer.cornerRadius = 5.0
        btn.layer.borderWidth = 1.0
        btn.layer.borderColor = UIColor.cyan.cgColor
        btn.addTarget(self, action: #selector(submitClick), for: .touchUpInside)
        return btn
    }()
    
}







extension LoginController : UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return emojiArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 35
    }
    ///mark row title
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return emojiArray[row]
    }
    
    //自定义每一行的row
//    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
//
//    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerView.selectRow(row, inComponent: component, animated: false)
        print("滚动停止 就选择了")
    }
    
    
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == passWord {
            pickView = UIPickerView.init(frame: CGRect(x: 50, y: self.view.frame.height / 2.0 - 80, width: self.view.frame.width - 100, height: 160))
            pickView.backgroundColor = UIColor.white
            pickView.delegate = self;
            pickView.dataSource = self
            pickView.layer.cornerRadius = 5.0
            pickView.layer.borderColor = UIColor.red.cgColor
            pickView.layer.borderWidth = 0.5
            ///MARK: 这里需要注意一下，初始化设置了默认选中， 就出现了分隔线。  没设置就没有分隔线呢，不懂怎么回事， 暂时也没有找到设置分隔线方法
            pickView.selectRow(Int(arc4random())%(emojiArray.count - 2) + 1, inComponent: 0, animated: true)
            pickView.selectRow(Int(arc4random())%(emojiArray.count - 2) + 1, inComponent: 1, animated: true)
            pickView.selectRow(Int(arc4random())%(emojiArray.count - 2) + 1, inComponent: 2, animated: true)
            self.view.addSubview(pickView)
       }
    }
    
}
