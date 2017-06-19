//
//  LyBaiduMapView.m
//  LyBaiduMapProtocol
//
//  Created by 张杰 on 2017/6/19.
//  Copyright © 2017年 张杰. All rights reserved.
//

#import "LyBaiduMapView.h"
#import <BaiduMapAPI_Base/BMKBaseComponent.h>//引入base相关所有的头文件
#import <BaiduMapAPI_Map/BMKMapComponent.h>//引入地图功能所有的头文件
#import <BaiduMapAPI_Map/BMKMapView.h>//只引入所需的单个头文件
#import <BaiduMapAPI_Search/BMKSearchComponent.h>//引入检索功能所有的头文件
#import <BaiduMapAPI_Cloud/BMKCloudSearchComponent.h>//引入云检索功能所有的头文件
#import <BaiduMapAPI_Location/BMKLocationComponent.h>//引入定位功能所有的头文件
#import <BaiduMapAPI_Utils/BMKUtilsComponent.h>//引入计算工具所有的头文件
#import "LyBaiduMapViewStatus.h"

@interface LyBaiduMapView ()<BMKMapViewDelegate,BMKGeoCodeSearchDelegate>

@property(nonatomic,strong)BMKMapView       *mapV;
@property(nonatomic,strong)BMKGeoCodeSearch *searchCode;//地理编码反编码

@end

@implementation LyBaiduMapView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.mapV];
    }
    return self;
}

#pragma mark - protocol方法
- (UIView *)mapView
{
    return self.mapV;
}

@synthesize delegate = _delegate;
- (void)setDelegate:(id<LyMapViewMapStatusProtocol>)delegate
{
    _delegate = delegate;
    
    if (delegate == nil) {
        self.mapV.delegate = nil;
    } else {
        self.mapV.delegate = self;
    }
}

//当mapview即将被显式的时候调用，恢复之前存储的mapview状态
-(void)viewWillAppear
{
    if (self.delegate != nil) {
        self.mapV.delegate = self;
    }
}

//当mapview即将被隐藏的时候调用，存储当前mapview的状态。
-(void)viewWillDisappear
{
    self.mapV.delegate = nil;
}

@synthesize showsUserLocation = _showsUserLocation;
- (BOOL)showsUserLocation
{
    return _showsUserLocation;
}

- (void)setShowsUserLocation:(BOOL)showsUserLocation
{
    _showsUserLocation = showsUserLocation;
    
    self.mapV.showsUserLocation = showsUserLocation;
}

- (void)updateLocationData:(id<LyUserLocal>)userLocation
{
    NSLog(@"%@",userLocation.userLocal);
    [self.mapV updateLocationData:userLocation.userLocal];
}

- (void)setCenterCoordinate:(CLLocationCoordinate2D)coordinate animated:(BOOL)animated
{
    [self.mapV setCenterCoordinate:coordinate animated:animated];
}

/**
 *设定当前地图的显示范围
 *@param center 中心点经纬度坐标
 *@param coordinateSpan 经纬度范围
 *@param animated 是否采用动画效果
 */
- (void)setRegion:(CLLocationCoordinate2D)center coordinateSpan:(CLLocationCoordinate2D)coordinateSpan animated:(BOOL)animated
{
    //2.将定位的点居中显示
    //跨度
    BMKCoordinateSpan span = BMKCoordinateSpanMake(coordinateSpan.latitude, coordinateSpan.longitude);
    //区域范围
    BMKCoordinateRegion coordinateRegion = BMKCoordinateRegionMake(center, span);
    [self.mapV setRegion:coordinateRegion animated:animated];
}

#pragma mark - 反地理编码出地理位置
/**
 *根据地理坐标获取地址信息
 */
- (BOOL)reverseGeoCode:(CLLocationCoordinate2D)coordinate
{
    BMKReverseGeoCodeOption *reverseGeoCodeSearchOption = [[BMKReverseGeoCodeOption alloc]init];
    reverseGeoCodeSearchOption.reverseGeoPoint = coordinate;
    return [self.searchCode reverseGeoCode:reverseGeoCodeSearchOption];
}

/**
 *返回反地理编码搜索结果
 *@param searcher 搜索对象
 *@param result 搜索结果
 *@param error 错误号，@see BMKSearchErrorCode
 */
- (void)onGetReverseGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKReverseGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error
{
    
}

#pragma mark - delegate

/**
 *地图初始化完毕时会调用此接口
 *@param mapView 地图View
 */
- (void)mapViewDidFinishLoading:(BMKMapView *)mapView
{
    if ([self.delegate respondsToSelector:@selector(mapViewDidFinishLoading:)]) {
        [self.delegate mapViewDidFinishLoading:mapView];
    }
}

/**
 *地图渲染完毕后会调用此接口
 *@param mapView 地图View
 */
- (void)mapViewDidFinishRendering:(BMKMapView *)mapView
{
    if ([self.delegate respondsToSelector:@selector(mapViewDidFinishRendering:)]) {
        [self.delegate mapViewDidFinishRendering:mapView];
    }
}

/**
 *地图渲染每一帧画面过程中，以及每次需要重绘地图时（例如添加覆盖物）都会调用此接口
 *@param mapView 地图View
 *@param status 此时地图的状态
 */
- (void)mapView:(BMKMapView *)mapView onDrawMapFrame:(BMKMapStatus*)status
{
    if ([self.delegate respondsToSelector:@selector(mapView:onDrawMapFrame:)]) {
        LyBaiduMapViewStatus *mapStatus = [[LyBaiduMapViewStatus alloc] initWithMapStatus:status];
        [self.delegate mapView:mapView onDrawMapFrame:mapStatus];
    }
}

/**
 *地图区域即将改变时会调用此接口
 *@param mapView 地图View
 *@param animated 是否动画
 */
- (void)mapView:(BMKMapView *)mapView regionWillChangeAnimated:(BOOL)animated
{
    if ([self.delegate respondsToSelector:@selector(mapView:regionWillChangeAnimated:)]) {
        [self.delegate mapView:mapView regionWillChangeAnimated:animated];
    }
}

/**
 *地图区域改变完成后会调用此接口
 *@param mapView 地图View
 *@param animated 是否动画
 */
- (void)mapView:(BMKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    if ([self.delegate respondsToSelector:@selector(mapView:regionDidChangeAnimated:)]) {
        [self.delegate mapView:mapView regionDidChangeAnimated:animated];
    }
}

///**
// *根据anntation生成对应的View
// *@param mapView 地图View
// *@param annotation 指定的标注
// *@return 生成的标注View
// */
//- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id <BMKAnnotation>)annotation;

#pragma mark - 私有方法
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.mapV.frame = self.bounds;
}

#pragma mark - get

- (BMKMapView *)mapV
{
    if (!_mapV) {
        _mapV = [[BMKMapView alloc] initWithFrame:self.bounds];
    }
    return _mapV;
}

- (BMKGeoCodeSearch *)searchCode
{
    if (!_searchCode) {
        _searchCode = [[BMKGeoCodeSearch alloc] init];
        _searchCode.delegate = self;
    }
    return _searchCode;
}

@end
