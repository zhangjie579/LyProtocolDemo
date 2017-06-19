//
//  LyMapViewMapStatusProtocol.h
//  LyBaiduMapProtocol
//
//  Created by 张杰 on 2017/6/19.
//  Copyright © 2017年 张杰. All rights reserved.
//  地图的一些配置

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@protocol LyMapViewMapStatusProtocol <NSObject>

///缩放级别:[3~19]
@property (nonatomic, assign) float fLevel;
///旋转角度
@property (nonatomic, assign) float fRotation;
///俯视角度:[-45~0]
@property (nonatomic, assign) float fOverlooking;
///屏幕中心点坐标:在屏幕内，超过无效
@property (nonatomic) CGPoint targetScreenPt;
///地理中心点坐标:经纬度
@property (nonatomic) CLLocationCoordinate2D targetGeoPt;

@end
