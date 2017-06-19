//
//  LyMapFactory.swift
//  LyMapProtocol
//
//  Created by 张杰 on 2017/6/19.
//  Copyright © 2017年 张杰. All rights reserved.
//

import UIKit


class LyBaiduMapFactory: NSObject, LyMapFactoryProtocol {
    
    required init(_ appKey: String) {
        super.init()
        if !isSetting {
            isSetting = true
            manager.start(appKey, generalDelegate: nil)
        }
    }
    
    func loadMapView(_ frame : CGRect) -> LyMapViewProtocol {
        
        return LyBaiduMapView(frame)
    }
    
    fileprivate let manager = BMKMapManager()
    fileprivate var isSetting = false
}
