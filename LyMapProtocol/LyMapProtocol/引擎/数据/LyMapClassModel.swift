//
//  LyMapClassModel.swift
//  LyMapProtocol
//
//  Created by 张杰 on 2017/6/19.
//  Copyright © 2017年 张杰. All rights reserved.
//

import UIKit

struct LyMapClassModel {
    var appKey : String?
    var className :String?
    var isOpen : Bool?
}

struct LyMapClassViewModel {
    
    mutating func loadData() {
        let path = Bundle.main.path(forResource: "LyConfiger", ofType: "plist")
        
        let array = NSArray(contentsOfFile: path!)
        
        for item in array! {
            let dict = item as! [String : Any]
            let model = LyMapClassModel(appKey: dict["appKey"] as? String, className: dict["className"] as! String, isOpen: dict["isOpen"] as! Bool)
            arrayModel.append(model)
        }
    }
    
    var arrayModel = [LyMapClassModel]()
}
