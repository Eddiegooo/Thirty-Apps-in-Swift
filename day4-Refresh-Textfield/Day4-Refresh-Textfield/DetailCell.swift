//
//  DetailCell.swift
//  Day4-Refresh-Textfield
//
//  Created by FQL on 2019/2/25.
//  Copyright © 2019 FQL. All rights reserved.
//

import UIKit



class DetailCell: UITableViewCell, UITextFieldDelegate {

    var inputTextField: UITextField = UITextField()
    var countLab: UILabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.inputTextField = UITextField(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 120))
        self.inputTextField.textColor = UIColor.black
        self.inputTextField.placeholder = "Input text"
        self.inputTextField.delegate = self
        self.contentView.addSubview(self.inputTextField)


        self.countLab = UILabel(frame: CGRect(x: 0, y: UIScreen.main.bounds.height - 30, width: UIScreen.main.bounds.width, height: 30))
        self.countLab.textColor = UIColor.lightGray
        self.countLab.text = "at most 20"
        self.countLab.textAlignment = .right
        self.contentView.addSubview(self.countLab)

    }
    
    
    //MARK: 将子视图放到这里，就能解决self.contentView.frame 始终是320*44的问题了。。
    // 但是放在这里加载子视图，刷新会重复添加
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        self.inputTextField = UITextField(frame: self.contentView.bounds)
//        self.inputTextField.textColor = UIColor.black
//        self.inputTextField.placeholder = "Input text"
//        self.inputTextField.delegate = self
//        self.contentView.addSubview(self.inputTextField)
//
//
//        self.countLab = UILabel(frame: CGRect(x: 0, y: self.contentView.bounds.height - 30, width: self.contentView.bounds.width, height: 30))
//        self.countLab.textColor = UIColor.lightGray
//        self.countLab.text = "at most 20"
//        self.countLab.textAlignment = .right
//        self.contentView.addSubview(self.countLab)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: Delegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //MARK: 感觉这个能满足需求啦。。
        let count = (textField.text?.count)!  + (string.count) - range.length
        if count > 20 {
            return false
        }
        self.countLab.text = "还可以输入：\(20-(textField.text?.count)!)"
        return true
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
