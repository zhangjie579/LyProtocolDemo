//
//  LyMapViewProtocol.h
//  LyBaiduMapProtocol
//
//  Created by 张杰 on 2017/6/19.
//  Copyright © 2017年 张杰. All rights reserved.
//  mapView的协议

#import <UIKit/UIKit.h>
#import "LyMapViewProtocolDelegate.h"
#import "LyUserLocal.h"

@protocol LyMapViewProtocol <NSObject>

//地图view
@property(nonatomic,strong,readonly)UIView   *mapView;
//设置地图delegate
@property(nonatomic,weak)id<LyMapViewProtocolDelegate> delegate;

//当mapview即将被显式的时候调用，恢复之前存储的mapview状态
-(void)viewWillAppear;

//当mapview即将被隐藏的时候调用，存储当前mapview的状态。
-(void)viewWillDisappear;

#pragma mark - 定位使用
/// 设定是否显示定位图层
@property(nonatomic,assign)BOOL showsUserLocation;

/**
 *动态更新我的位置数据
 *	@param	[in]	userLocation	定位数据
 */
-(void)updateLocationData:(id<LyUserLocal>)userLocation;

/**
 *设定地图中心点坐标
 *@param coordinate 要设定的地图中心点坐标，用经纬度表示
 *@param animated 是否采用动画效果
 */
- (void)setCenterCoordinate:(CLLocationCoordinate2D)coordinate animated:(BOOL)animated;

@property(nonatomic,assign)CLLocationCoordinate2D coordinateSpan;

/**
 *设定当前地图的显示范围
 *@param center 中心点经纬度坐标
 *@param coordinateSpan 经纬度范围
 *@param animated 是否采用动画效果
 */
- (void)setRegion:(CLLocationCoordinate2D)center coordinateSpan:(CLLocationCoordinate2D)coordinateSpan animated:(BOOL)animated;

#pragma mark - 反地理编码出地理位置
/**
 *根据地理坐标获取地址信息
 */
- (BOOL)reverseGeoCode:(CLLocationCoordinate2D)coordinate;
@end
