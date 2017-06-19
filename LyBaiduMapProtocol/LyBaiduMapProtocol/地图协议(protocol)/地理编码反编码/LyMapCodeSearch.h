//
//  LyMapCodeSearch.h
//  LyBaiduMapProtocol
//
//  Created by 张杰 on 2017/6/19.
//  Copyright © 2017年 张杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "LyMapCodeSearchDelegate.h"

@protocol LyMapCodeSearch <NSObject>

@property(nonatomic,weak)id<LyMapCodeSearchDelegate> delegate;

/**
 *根据地址名称获取地理信息
 *异步函数，返回结果在BMKGeoCodeSearchDelegate的onGetAddrResult通知
 *@param geoCodeOption       geo检索信息类
 *@return 成功返回YES，否则返回NO
 */
- (BOOL)geoCode:(NSString *)address city:(NSString *)city;
/**
 *根据地理坐标获取地址信息
 *异步函数，返回结果在BMKGeoCodeSearchDelegate的onGetAddrResult通知
 *@param reverseGeoCodeOption 反geo检索信息类
 *@return 成功返回YES，否则返回NO
 */
- (BOOL)reverseGeoCode:(CLLocationCoordinate2D)reverseGeoCodeOption;

@end
