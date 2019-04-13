//
//  SecondViewController.swift
//  day30—Swift5-New-Program
//
//  Created by FQL on 2019/4/11.
//  Copyright © 2019 FQL. All rights reserved.
//

import UIKit

typealias tempClose = (String) -> Void

//最大区别：  结构体是传值，类是传引用
struct customStruct {
    var name: String = "Eddiegooo"
    
    func nijiaoshalie(name: String) -> String {
        return self.name + name
    }
    
}


//错误处理。。
enum errorType: Error {
    case nameError
    case nameInliad
}

class SecondViewController: UIViewController {

    var newName = "Diieeo"
    
    var secondBlock: tempClose?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view .addSubview(customBtn)
    }
    
    
    //错误处理方式
    func errorSolove (name: String) throws  -> String {
        if name == "Eddiegooo" {
            throw errorType.nameInliad
        }
        
        //do catch 也可以处理
        do{
            let name = try errorSolove(name: "tttt")
            print(name)
        }catch errorType.nameError{
            print("name error")
        }catch errorType.nameInliad {
            print("name wu xiao")
        }
        
        return "change a name"
    }
    
    
    //泛型
    func funxinghanshu<String>(name: String) -> [String] {
        return ["name", "age"] as! [String]
    }
 
    
    @objc func transferToApp () -> Void {
        if self.secondBlock != nil {
            self.secondBlock!("Eddiegooo")
        }
        self.dismiss(animated: true, completion: nil)
    }

    //懒加载实际上就是一个闭包。  闭包类型是无参 返回值是自己的闭包。   后面（）就是执行闭包，
    lazy var customBtn: UIButton = { () -> UIButton in
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        btn.center = self.view.center
        btn.setTitle("来了老弟，点我啊", for: .normal)
        btn.setTitleColor(UIColor.red, for: .normal)
        btn.setImage(UIImage(named: ""), for: .normal)
        btn.backgroundColor = UIColor.white
        btn.addTarget(self, action: #selector(transferToApp), for: UIControl.Event.touchUpInside)
        return btn
    }()

}


//使用 extension 来为现有的类型添加功能，比如新的方法和计算属性。你可以使用扩展让某个在别处声明的类型来遵守某个协议，这同样适用于从外部库或者框架引入的类型。
extension SecondViewController {

}
