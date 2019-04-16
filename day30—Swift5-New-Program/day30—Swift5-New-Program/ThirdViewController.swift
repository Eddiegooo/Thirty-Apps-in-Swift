//
//  ThirdViewController.swift
//  day30—Swift5-New-Program
//
//  Created by FQL on 2019/4/16.
//  Copyright © 2019 FQL. All rights reserved.
//

import UIKit

enum ErrorItem : Error{
    case netWorkError
    case requestError
}

class ThirdViewController: UIViewController {
    
    /// 元组在临时组织值的时候很有用，但是并不适合创建复杂的数据结构。如果你的数据结构并不是临时使用，请使用类或者结构体而不是元组。
    let yuanzu = (404, "net work is not found;", 10000, "net work request wrong")
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let (code, _, worongCode, _) = yuanzu
        print(yuanzu.1 + yuanzu.3)
        print(code + worongCode)
        
        
        // 断言和先决条件 可以是你的代码更加健壮。   可以用他们来检查在执行后续代码之前是否一个必要的条件已经被满足了。。。  在生产环境中，断言的条件将不会进行评估
        
//       Asset  表达式的结果为 false 的时候这条信息会被显示
//        可以使用全局 precondition(_:_:file:line:) 函数来写一个先决条件。向这个函数传入一个结果为 true 或者 false 的表达式以及一条信息，当表达式的结果为 false 的时候这条信息会被显示：
        



//        Swift 也提供恒等（===）和不恒等（!==）这两个比较符来判断两个对象是否引用同一个对象实例。

        
//        逻辑运算符   为左结合   d所以可以多个结合使用。
        //如果有密码和账号 或者有手机号 在后者邮箱 我们都可以登录
//        if mima && zhanghao || shoujihao || youxiang {
//            print("可以登录")
//        }
    }
    

    func dealWithError () throws {
        assert(yuanzu.0 > 3, "当所有数的和大于0才可以。 只在Debug环境下有效， 所以你可以大量的时候这个")
        precondition(yuanzu.2 > 4, "这个是先觉条件，必须满足，debug和生产环境都有效")
        print("处理错误")
    }
    
    func testErrorReport () -> Void {
        do {
            try dealWithError()
            //没有错误抛出
        } catch  {
            // 有错误抛出
            assertionFailure("有错误喽 程序不给你执行了啊")
        }
        
        
        
        do {
            try dealWithError()
            //如果上面这个函数没有有任何错误抛出， 这里就会被执行了
            print("上面没有错误， 可以继续执行这里的东西拉")
        } catch ErrorItem.requestError {
            print("网络请求失败了")
        }catch ErrorItem.netWorkError {
            print("网络异常")
        }catch {
            print("Defult Error")
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
