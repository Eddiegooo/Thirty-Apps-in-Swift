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
    
//    扩展和 Objective-C 的分类很相似。（与 Objective-C 分类不同的是，Swift 扩展是没有名字的。）
    
//    添加计算型实例属性和计算型类属性
//    定义实例方法和类方法
//    提供新的构造器
//    定义下标
//    定义和使用新的嵌套类型
//    使已经存在的类型遵循（conform）一个协议
    /// ***********注意
//    注意
//    扩展可以给一个类型添加新的功能，但是不能重写已经存在的功能。
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

//Open 和 Public 级别可以让实体被同一模块源文件中的所有实体访问，在模块外也可以通过导入该模块来访问源文件里的所有实体


//结构体会自动生成构造
struct Size {
    var width = 1.5
    var height = 6.0
}

let size = Size(width: 2, height: 8)


enum funcErrorType: Error {
    case invidType
    case noReasonType
    case iLikeError
}

//类不能自动生成
class CustomClass {
    var name: String = ""
    var age: Int = 30
    let sex = 1
    
    
    func checkName() -> Void {
        /// 错误处理方法：1.try! 禁用错误传递 2.try？ 将错误转换成可选值
        try! self.textThrowErrorFunc(name: "Eddiegooo")
        
        
        //3. do try catch 处理错误
        do {
            try self.textThrowErrorFunc(name: "qinglong")
        } catch funcErrorType.iLikeError {
            print("我就是不要你 ")
        } catch funcErrorType.invidType {
            print("你的输入错误")
        } catch funcErrorType.noReasonType {
            print("没有理由，你输入啥都是错误的")
        } catch {
            //真是牛逼了ty。。。  即使每个错误类型都被处理了，也要加这个。。。
            print("// 加入一个空的catch，用于关闭catch。否则会报错：Errors thrown from here are not handled because the enclosing catch is not exhaustive")
        }
        
    }
    
    
    func textThrowErrorFunc(name: String) throws -> Void {
        guard name.isEmpty  else {
            throw funcErrorType.invidType
        }
        
        guard name == "Eddie" else {
            throw funcErrorType.iLikeError
        }
    }


}



///类型转换
class MediaItem {
    var name : String
    init(name: String) {
        self.name = name
    }
    
    
    
}

class MovieItem: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class ArtistItem: MediaItem {
    var artist: String
    init(name: String, artist:String) {
        self.artist = artist
        super.init(name: name)
    }
}


let library = [
    MovieItem(name: "daxiahun", director: "Xiaohe"),
    ArtistItem(name: "huahua", artist: "fangao")
]

func testItemFunc() -> Void {
    var moiveCount = 0
    var artistCount = 0
    
    for item in library {
        if item is MovieItem {
            moiveCount += 1
        }
        if item is ArtistItem {
           artistCount = artistCount + 1
        }
    }
}





