//
//  ViewController.swift
//  day30—Swift5-New-Program
//
//  Created by FQL on 2019/4/3.
//  Copyright © 2019 FQL. All rights reserved.
//

import UIKit

typealias successCompletion = (_ result: AnyObject) -> (AnyObject)
typealias failureCompletion = (_ error: Error) ->(AnyObject)

class ViewController: UIViewController {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        let secondVC = SecondViewController()
        //swift 闭包不能自动联想呢。。。
        secondVC.secondBlock = {(name: String) -> Void in
            print(name)
        }
        
        secondVC.secondBlock = {
            print($0)
        }
        
        secondVC.secBlock = {(name: String, age:Int) -> String in
            return "name:\(name) , age:\(age)"
        }
        
        // 这个闭包真是奇怪， 不联想呢。。 还有这个参数 怎么写都行。。。
        secondVC.secBlock = {(name, age) -> String in
            return ""
        }
        secondVC.secBlock = {(anme, ages) -> String in
            return "name = \(anme),, age:\(ages)"
        }
        
        // MARK: 怪不得不联想， 原来可以这么写啊 😆  6666
        secondVC.secBlock = {
            return "name = \($0), age: \($1)"
        }
        self.present(secondVC, animated: true, completion: nil)
        
    }
    
    
//    二，逃逸闭包。。  类似于OC里的，block回调，多数用于网络请求等
//    如果一个闭包被作为一个参数传递给一个函数，并且在函数return之后才被唤起执行，那么我们称这个闭包的参数是“逃出”这个函数体外，这个闭包就是逃逸闭包。此时可以在形式参数前写 @escaping来明确闭包是允许逃逸的。
//    闭包可以逃逸的一种方法是被储存在定义于函数外的变量里。比如说，很多函数接收闭包实际参数来作为启动异步任务的回调。函数在启动任务后返回，但是闭包要直到任务完成——闭包需要逃逸。
    func testRequest(url: String, result: @escaping (_ result: AnyObject) -> AnyObject) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
     
        
        /// 多行字符串 """  """
        let count = 5
        let moreLineString = """
        这是多行字符串的写法哎。 截止到今天已经\(count)天没有见到老婆了.
        你知道么 "i miss U"
        """
        print(moreLineString)
        
        ///switch 不需要break，执行会自动结束。 但必须要有default。  比较条件很宽泛，只要是bool类型就行
        let string = "zheme zenme"
        switch string {
        case "fsdf":
            print("OK")
        case let x where x.hasPrefix("zh") :
            print("duile")
        default:
            print("laile")
        }
        
        //类型转换
        let label = "The width is"
        let width = 94
        var widthLabel = label + String(width)
        widthLabel = "The width is \(width)"   //简单方式： \() 来把一个浮点计算转换成字符串
        print(widthLabel)
        
        
        myNameIs(name: "Eddie")
        
        newMyNameIs("Eddiegooo", and: 28)
        
        
        // 这里可以使用元祖下标取返回值的对应序列的值。 statistics.1
        let statistics = calculateStatistics(scores:[5, 3, 100, 3, 9])
        print(statistics.sum)
        print(statistics.1)
        
        //函数当返回值
        let funcs = returnFunc(count: 5)
        print(funcs(6))
        
        
        //函数s当参数  调用参数很有趣。 直接写名字，不能带参数。。。。
        let array = [2,34, 6,45]
        print(compare(array: array, condation: compareCondation))
        
        
        //闭包
        let numbers = [3,6,75,5]
        let result = numbers.map({
            (number: Int) -> Int in
            let result = number + 5
            return result
        })
        print("result = \(result)")
        
    }
    
    //函数
    func myNameIs(name: String) -> Void {
        print("my name is :\(name)")
    }

    //默认情况下，函数使用它们的参数名称作为它们参数的标签，在参数名称前可以自定义参数标签，或者使用 _ 表示不使用参数标签。  调用的时候不体现参数名称。  不习惯这样子哎
    func newMyNameIs(_ name: String, and age: Int) -> Void {
        print("my name is: \(name), age is:\(age)")
    }
    
    
    //使用元组来生成复合值，比如让一个函数返回多个值。该元组的元素可以用名称或数字来获取。
    func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
        var min = scores[0]
        var max = scores[0]
        var sum = 0
        
        for score in scores {
            if score > max {
                max = score
            } else if score < min {
                min = score
            }
            sum += score
        }
        
        return (min, max, sum)
    }

    // 函数嵌套函数；   函数也可以当做参数传入另一个函数。
    func returnFifteen() -> Int {
        var x = 10
        func add() {
            x += 5
        }
        add()
        return x
    }
    
    // 函数是第一等类型，这意味着函数可以作为另一个函数的返回值。
    func returnFunc(count: Int) -> ((Int) -> Int) {
        func innerFunc(index: Int) -> Int {
            return index + 5
        }
        return innerFunc  //这里函数返回 也只写名称 不能带参数。
    }
    
    //函数当参数
    func compare (array: [Int], condation: (Int) -> Bool) -> Bool {
        for item in array {
            if condation(item) {
                return true
            }
        }
        return false
    }
    func compareCondation(index: Int ) -> Bool {
        return index < 10
    }

    
}

