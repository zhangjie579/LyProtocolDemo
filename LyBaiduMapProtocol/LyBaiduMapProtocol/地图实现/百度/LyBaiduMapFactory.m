//
//  LyBaiduMapFactory.m
//  LyBaiduMapProtocol
//
//  Created by 张杰 on 2017/6/19.
//  Copyright © 2017年 张杰. All rights reserved.
//

#import "LyBaiduMapFactory.h"
#import <BaiduMapAPI_Map/BMKMapView.h>//只引入所需的单个头文件
#import "LyBaiduMapView.h"
#import "LyBaiduMapLocal.h"

@interface LyBaiduMapFactory ()


//@property(nonatomic,strong)
@property(nonatomic,strong)BMKMapManager *mapManager;

@end

@implementation LyBaiduMapFactory

//1.配置地图key
- (void)setupAppKey:(NSString *)appKey
{
    self.mapManager = [[BMKMapManager alloc]init];
    [self.mapManager start:appKey generalDelegate:nil];
}

//2.展示地图map
- (id<LyMapViewProtocol>)loadMapWithFrame:(CGRect)frame
{
    LyBaiduMapView *mapView = [[LyBaiduMapView alloc] initWithFrame:frame];
    
    return mapView;
}

- (id<LyLocalProtocol>)loaclTool
{
    LyBaiduMapLocal *loacl = [[LyBaiduMapLocal alloc] init];
    return loacl;
}

@end
