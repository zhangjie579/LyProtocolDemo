//
//  ViewController.swift
//  LyMapProtocol
//
//  Created by 张杰 on 2017/6/19.
//  Copyright © 2017年 张杰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        loadMapView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        mapContentView?.viewWillAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        mapContentView?.viewWillDisappear()
    }

    //1.工厂
    fileprivate lazy var factory : LyMapFactoryProtocol = {
        let factory = LyMapEngine.shareManager().loadFactory()
        return factory!;
    }()
    
    //2.地图map
    fileprivate var mapContentView : LyMapViewProtocol?
}

extension ViewController {
    fileprivate func loadMapView() {
        mapContentView = factory.loadMapView(view.frame)
        mapContentView?.delegate = self
        view.addSubview(mapContentView as! UIView)
    }
}

extension ViewController : LyMapViewDelegate {
    func mapViewDidFinishLoading(_ mapView: UIView) {
        print("加载完成")
    }
}

