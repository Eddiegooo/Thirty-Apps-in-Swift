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
    
    /*
     这是一个多行h注释
     /*
        这里面还有很多注释呢。。
     */
     这都没有关系，里面可以随便嵌入
     */
    
    
    /// 你打算在同一行内写多条独立的语句,这时候就要加一个分号分开啦
    
    
    
    /// 尽量不要使用 UInt，除非你真的需要存储一个和当前平台原生字长相同的无符号整数。除了这种情况，最好使用 Int，即使你要存储的值已知是非负的。统一使用 Int 可以提高代码的可复用性，避免不同类型数字之间的转换，并且匹配数字的类型推断，
    
    /// Double 精确度很高，至少有15位数字，而 Float 只有6位数字。选择哪个类型取决于你的代码需要处理的值的范围，在两种类型都匹配的情况下，将优先选择 Double。
    
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
