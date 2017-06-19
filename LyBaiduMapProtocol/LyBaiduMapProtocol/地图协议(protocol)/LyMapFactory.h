//
//  LyMapFactory.h
//  LyBaiduMapProtocol
//
//  Created by 张杰 on 2017/6/19.
//  Copyright © 2017年 张杰. All rights reserved.
//  工厂协议

#import <Foundation/Foundation.h>
#import "LyMapViewProtocol.h"
#import "LyLocalProtocol.h"

@protocol LyMapFactory <NSObject>

//1.配置地图key
- (void)setupAppKey:(NSString *)appKey;

//2.展示地图map
- (id<LyMapViewProtocol>)loadMapWithFrame:(CGRect)frame;

//3.定位
- (id<LyLocalProtocol>)loaclTool;

@end
