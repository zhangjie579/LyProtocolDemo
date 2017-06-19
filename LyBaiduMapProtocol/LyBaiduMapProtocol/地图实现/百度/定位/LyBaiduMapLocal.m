//
//  LyBaiduMapLocal.m
//  LyBaiduMapProtocol
//
//  Created by 张杰 on 2017/6/19.
//  Copyright © 2017年 张杰. All rights reserved.
//

#import "LyBaiduMapLocal.h"
#import <BaiduMapAPI_Base/BMKBaseComponent.h>//引入base相关所有的头文件
#import <BaiduMapAPI_Map/BMKMapComponent.h>//引入地图功能所有的头文件
#import <BaiduMapAPI_Location/BMKLocationComponent.h>
#import "LyUserLocalModel.h"

@interface LyBaiduMapLocal ()<BMKLocationServiceDelegate>

@property(nonatomic,strong)BMKLocationService *locService;
//@property(nonatomic,strong)LyUserLocalModel   *userLocalModel;

@end

@implementation LyBaiduMapLocal

- (instancetype)init
{
    if (self = [super init]) {
//        _locService.delegate = self;
    }
    return self;
}

#pragma mark - 协议方法
//开始定位
- (void)startLocal
{
    [self.locService startUserLocationService];
}
//结束定位
- (void)stopLocal
{
    [self.locService stopUserLocationService];
}

@synthesize delegate = _delegate;
- (void)setDelegate:(id<LyLocalDelegate>)delegate
{
    _delegate = delegate;
    if (delegate == nil)
    {
        self.locService.delegate = nil;
    }
    else
    {
        self.locService.delegate = self;
    }
}

- (id)localManager
{
    return self.locService;
}

#pragma mark - delegate
/**
 *在将要启动定位时，会调用此函数
 */
- (void)willStartLocatingUser
{
    if ([self.delegate respondsToSelector:@selector(willStartLocatingUser)]) {
        [self.delegate willStartLocatingUser];
    }
}

/**
 *在停止定位后，会调用此函数
 */
- (void)didStopLocatingUser
{
    if ([self.delegate respondsToSelector:@selector(didStopLocatingUser)]) {
        [self.delegate didStopLocatingUser];
    }
}

/**
 *用户方向更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
    if ([self.delegate respondsToSelector:@selector(didUpdateUserHeading:)]) {
//        self.userLocalModel.userLocation = userLocation;
        [self.delegate didUpdateUserHeading:[[LyUserLocalModel alloc] initWithUserLocation:userLocation]];
    }
}

/**
 *用户位置更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    if ([self.delegate respondsToSelector:@selector(didUpdateBMKUserLocation:)]) {
//        self.userLocalModel.userLocation = userLocation;
        [self.delegate didUpdateBMKUserLocation:[[LyUserLocalModel alloc] initWithUserLocation:userLocation]];
    }
}

/**
 *定位失败后，会调用此函数
 *@param error 错误号
 */
- (void)didFailToLocateUserWithError:(NSError *)error
{
    if ([self.delegate respondsToSelector:@selector(didFailToLocateUserWithError:)]) {
        [self.delegate didFailToLocateUserWithError:error];
    }
}

#pragma mark - get
- (BMKLocationService *)locService
{
    if (!_locService) {
        _locService = [[BMKLocationService alloc] init];
    }
    return _locService;
}

@end
