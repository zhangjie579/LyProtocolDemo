//
//  LyMapEngine.swift
//  LyMapProtocol
//
//  Created by 张杰 on 2017/6/19.
//  Copyright © 2017年 张杰. All rights reserved.
//

import UIKit

class LyMapEngine: NSObject {

    //MARK: 单例
    private static let engine = LyMapEngine()
    
    class func shareManager() -> LyMapEngine {
        return engine
    }
    
    private override init() {
        super.init()
    }
    
    fileprivate lazy var viewModel : LyMapClassViewModel = {
        let viewModel = LyMapClassViewModel()
        return viewModel
    }()
}

//MARK: 工厂
extension LyMapEngine {
    func loadFactory() -> LyMapFactoryProtocol? {
        
        viewModel.loadData()
        
        for model in viewModel.arrayModel {
            if model.isOpen! {
                let appName = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String
                let className = NSClassFromString(appName! + "." + model.className!) as? LyMapFactoryProtocol.Type
                if className != nil {
                    let factory = className!.init(model.appKey!)
                    return factory
                }
            }
        }
        return nil
    }
}
