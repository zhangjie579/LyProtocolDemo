//
//  LyMapFactory.swift
//  LyMapProtocol
//
//  Created by 张杰 on 2017/6/19.
//  Copyright © 2017年 张杰. All rights reserved.
//

import UIKit

protocol LyMapFactoryProtocol {
    //1.配置appkey
    init(_ appKey : String)
    
    //2.地图view
    func loadMapView(_ frame : CGRect) -> LyMapViewProtocol
}
