//
//  LyMapViewProtocol.swift
//  LyMapProtocol
//
//  Created by 张杰 on 2017/6/19.
//  Copyright © 2017年 张杰. All rights reserved.
//

import UIKit

protocol LyMapViewProtocol {
    
    //1.初始化
    init(_ mapViewFrame : CGRect)
    //2.将出现将消失
    func viewWillAppear()
    func viewWillDisappear()
    
    weak var delegate : LyMapViewDelegate? { get set }
    
    var mapViews : UIView { get }
}

extension LyMapViewProtocol {
    
    
}
