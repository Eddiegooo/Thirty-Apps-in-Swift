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

