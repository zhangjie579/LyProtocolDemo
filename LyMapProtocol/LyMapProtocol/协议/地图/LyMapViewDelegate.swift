//
//  LyMapViewDelegate.swift
//  LyMapProtocol
//
//  Created by 张杰 on 2017/6/19.
//  Copyright © 2017年 张杰. All rights reserved.
//

import UIKit

@objc protocol LyMapViewDelegate {
    @objc func mapViewDidFinishLoading(_ mapView : UIView)
}
