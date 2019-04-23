//
//  ForthViewController.swift
//  day30—Swift5-New-Program
//
//  Created by FQL on 2019/4/22.
//  Copyright © 2019 FQL. All rights reserved.
//

import UIKit

//结构体和枚举都是值类型！！！！   类是引用类型。  二者根本区别
struct TestStruct {
    var startCount: Int
    var endCount: Int
}

class ForthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //所有结构体都有一个自动生成的成员逐一构造器，用于初始化新结构体实例中成员的属性
        let customStruct = TestStruct(startCount: 20, endCount: 100)
        print(customStruct)
        
        
        // Do any additional setup after loading the view.
    }
    
    //如果闭包表达式是函数或方法的唯一参数，则当你使用尾随闭包时，你甚至可以把 () 省略掉：
//    reversedNames = names.sorted { $0 > $1 }
    
    /**
     枚举类型
     1。 每个case没有默认值，相反 他们有自己的值。   也可以设置原始值，但是类型必须相同
     2. 列举枚举的时候，要q完全覆盖，不然会报错。
     每个枚举不用break，不会贯穿
     部分枚举，加一个default分支。
     多个成员，用,分开
     CaseIterable 遵循这个协议，就可以得到所有成员的集合
     */
    enum SwiftEnumDirection : CaseIterable {
        case west
        case east
        case north
        case sourth
    }
    
    enum defaultEnum : Int {
        case one = 1
        case two = 2
        case three = 3
//        case four = "4"  报错。。
    }
    
    //枚举关联类型
    enum code {
        case qrcode(String)
        case lineCode(Int, Int, Int, Int)
    }
    
    enum kediguiEnum {
        case count(Int)
        indirect case addtion(kediguiEnum, kediguiEnum)
    }
    
    
    

    
    
//    Swift 中结构体和类有很多共同点。两者都可以：
//    定义属性用于存储值
//    定义方法用于提供功能
//    定义下标操作用于通过下标语法访问它们的值
//    定义构造器用于设置初始值
//    通过扩展以增加默认实现之外的功能
//    遵循协议以提供某种标准功能

    
//    与结构体相比，类还有如下的附加功能：
//    继承允许一个类继承另一个类的特征
//    类型转换允许在运行时检查和解释一个类实例的类型
//    析构器允许一个类实例释放任何其所被分配的资源
//    引用计数允许对一个类的多次引用
    
    
    //    类支持的附加功能是以增加复杂性为代价的。作为一般准则，优先使用结构体，因为它们更容易理解，仅在适当或必要时才使用类。实际上，这意味着你的大多数自定义数据类型都会是结构体和枚举
    
    
//    VideoMode()。通过这种方式所创建的类或者结构体实例，其属性均会被初始化为默认值
//    结构体和枚举能够定义方法是 Swift 与 C/Objective-C 的主要区别之一
    
    
    
//    继承是区分「类」与其它类型的一个基本特征
}




class StepCounter {
    var totalSteps  = 0 {
        willSet(newTotalSteps) {
            print("将totalSteps 的值设置为\(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                print("增加了\(totalSteps - oldValue)）步")
            }
        }
    }
}
