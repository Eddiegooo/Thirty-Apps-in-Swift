//
//  HexString.swift
//  day8-RandomColor
//
//  Created by FQL on 2019/3/5.
//  Copyright © 2019 FQL. All rights reserved.
//

import Foundation
import UIKit

//MARK: 单独创建一个swift文件。
extension String {
    ///  Translate Hex String to UIColor, support following formats:
    ///  "00ffff", "#00ffff", "0x00ffff"
    
    func changeToUIColor() -> UIColor {
        
        //MARK:
        guard self.hasPrefix("#") && self.count == 7 ||
        self.hasPrefix("0x") && self.count == 8  ||
        self.count == 6 else {
            return UIColor.red
        }
        
        var origin = self
        
        if (self.hasPrefix("#")) {
            //MARK: 直接这么写不行了。。要换.  现在的写法很麻烦啊。。。
//            origin = origin[1..<origin.count]
            origin = String(origin[origin.index(origin.startIndex, offsetBy: 1)..<origin.endIndex])
        } else if (self.hasPrefix("0x")) {
            origin = String(origin[origin.index(origin.startIndex, offsetBy: 2)..<origin.endIndex])
        }
        
        var red: UInt32 = 0, green: UInt32 = 0, blue: UInt32 = 0
        
        Scanner(string: String(origin[origin.startIndex..<origin.index(origin.startIndex, offsetBy: 2)])).scanHexInt32(&red)
        
        Scanner(string: String(origin[origin.index(origin.startIndex, offsetBy: 2)..<origin.index(origin.startIndex, offsetBy: 4)])).scanHexInt32(&green)
            
        Scanner(string: String(origin[origin.index(origin.startIndex, offsetBy: 4)..<origin.index(origin.startIndex, offsetBy: 6)])).scanHexInt32(&blue)
        
       
        
        return UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1)
    }
}
