//
//  LyMapCodeSearchDelegate.h
//  LyBaiduMapProtocol
//
//  Created by 张杰 on 2017/6/19.
//  Copyright © 2017年 张杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LyCodeResult.h"

@protocol LyMapCodeSearchDelegate <NSObject>

@optional
/**
 *返回地址信息搜索结果
 *@param searcher 搜索对象
 *@param result 搜索结BMKGeoCodeSearch果
 *@param error 错误号，@see BMKSearchErrorCode
 */
- (void)onGetGeoCodeResult:(id)searcher result:(id<LyCodeResult>)result errorCode:(BMKSearchErrorCode)error;

///**
// *返回反地理编码搜索结果
// *@param searcher 搜索对象
// *@param result 搜索结果
// *@param error 错误号，@see BMKSearchErrorCode
// */
//- (void)onGetReverseGeoCodeResult:(id)searcher result:(BMKReverseGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error;

@end
