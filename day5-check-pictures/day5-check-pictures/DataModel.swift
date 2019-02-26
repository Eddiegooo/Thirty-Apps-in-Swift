//
//  DataModel.swift
//  day5-check-pictures
//
//  Created by FQL on 2019/2/26.
//  Copyright © 2019 FQL. All rights reserved.
//

import UIKit

class DataModel: NSObject {

    var title = ""
    var picture: UIImage!
    
    init(title: String, image: UIImage!) {
        self.title = title
        self.picture = image
    }
    
    //MARK: 这里不加static 会报错呢？  不知道什么原因？？？？
    
    static func createDataModel() -> [DataModel] {
        return [DataModel(title: "小婊砸，你很浪啊🐺", image: UIImage(named: "pic1")),
        DataModel(title: "来了 老弟？  来了， 老姐", image: UIImage(named: "pic2")),
        DataModel(title: "咣咣咣 咣咣咣， 哎呦 我去", image: UIImage(named: "pic3")),
        DataModel(title: "鲁班留恋，这是人家的鲁班", image: UIImage(named: "pic4")),
        DataModel(title: "嘿，你的益达， 不，是你的益达", image: UIImage(named: "pic5")),
        DataModel(title: "你好他好我好，汇源肾宝", image: UIImage(named: "pic6"))
        ]
    }
    
}
