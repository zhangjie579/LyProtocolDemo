//
//  ViewController.m
//  LyBaiduMapProtocol
//
//  Created by 张杰 on 2017/6/19.
//  Copyright © 2017年 张杰. All rights reserved.
//

#import "ViewController.h"
#import "LyMapEngine.h"

@interface ViewController ()<LyMapViewProtocolDelegate,LyLocalDelegate>

@property(nonatomic,strong)LyMapEngine           *mapEngine;//引擎
@property(nonatomic,strong)id<LyMapFactory>      factory;//工厂
@property(nonatomic,strong)id<LyMapViewProtocol> contentView;//map
@property(nonatomic,strong)id<LyLocalProtocol>   localManager;//定位

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self loadFactory];
}

- (void)dealloc
{
    NSLog(@"-----");
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.contentView viewWillAppear];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.contentView viewWillDisappear];
}

- (void)loadFactory
{
    [self.view addSubview:self.contentView];
}

#pragma mark - delegate

#pragma mark - 地图delegate
/**
 *地图初始化完毕时会调用此接口
 *@param mapView 地图View
 */
- (void)mapViewDidFinishLoading:(UIView *)mapView
{
    [self.localManager startLocal];
    NSLog(@"地图初始化完毕");
}

#pragma mark - 定位delegate

/**
 *用户位置更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateBMKUserLocation:(id<LyUserLocal>)userLocation
{
    [self.localManager stopLocal];
    self.contentView.showsUserLocation = YES;
    
    //1.更新我的位置数据
    [self.contentView updateLocationData:userLocation];
    
    //2.设置地图的中心位置
    [self.contentView setCenterCoordinate:userLocation.location.coordinate animated:YES];
    
    //3.设置当前地图的显示范围
    [self.contentView setRegion:userLocation.location.coordinate coordinateSpan:CLLocationCoordinate2DMake(0.014383, 0.012235) animated:YES];
}

/**
 *定位失败后，会调用此函数
 *@param error 错误号
 */
- (void)didFailToLocateUserWithError:(NSError *)error
{
    NSLog(@"定位失败");
}

#pragma mark - get
//0.引擎
- (LyMapEngine *)mapEngine
{
    if (!_mapEngine) {
        _mapEngine = [LyMapEngine shareManger];
    }
    return _mapEngine;
}

//1.引擎  ->  工厂
- (id<LyMapFactory>)factory
{
    if (!_factory) {
        _factory = [self.mapEngine creatFactory];
    }
    return _factory;
}

//2.工厂  ->  map
- (id<LyMapViewProtocol>)contentView
{
    if (!_contentView) {
        _contentView = [self.factory loadMapWithFrame:self.view.frame];
        _contentView.delegate = self;
    }
    return _contentView;
}

//3.工厂  -> 定位
- (id<LyLocalProtocol>)localManager
{
    if (!_localManager) {
        _localManager = [self.factory loaclTool];
        _localManager.delegate = self;
    }
    return _localManager;
}

@end
