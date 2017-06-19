//
//  LyBaiduMapViewStatus.h
//  LyBaiduMapProtocol
//
//  Created by 张杰 on 2017/6/19.
//  Copyright © 2017年 张杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LyMapViewMapStatusProtocol.h"
#import <BaiduMapAPI_Base/BMKBaseComponent.h>//引入base相关所有的头文件
#import <BaiduMapAPI_Map/BMKMapComponent.h>//引入地图功能所有的头文件

@interface LyBaiduMapViewStatus : NSObject<LyMapViewMapStatusProtocol>

- (instancetype)initWithMapStatus:(BMKMapStatus *)status;

@end
