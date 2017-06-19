//
//  LyBaiduMapView.swift
//  LyMapProtocol
//
//  Created by 张杰 on 2017/6/19.
//  Copyright © 2017年 张杰. All rights reserved.
//

import UIKit

class LyBaiduMapView: UIView,LyMapViewProtocol {
    
    required init(_ mapViewFrame: CGRect) {
        super.init(frame: mapViewFrame)
        mapView.frame = mapViewFrame
        addSubview(mapView)
    }
    
    weak var delegate : LyMapViewDelegate? {
        didSet {
            if delegate == nil {
                mapView.delegate = nil
            } else {
                mapView.delegate = self
            }
        }
    }
    
    func viewWillAppear() {
        if delegate != nil {
            mapView.delegate = self
        }
    }
    
    func viewWillDisappear() {
        mapView.delegate = nil
    }
    
    var mapViews: UIView {
        return mapView
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: 懒加载
    fileprivate let mapView = BMKMapView()
}

extension LyBaiduMapView : BMKMapViewDelegate {
    
    //地图初始化完毕时会调用此接口
    func mapViewDidFinishLoading(_ mapView: BMKMapView!) {
        delegate?.mapViewDidFinishLoading(mapView)
    }
}
